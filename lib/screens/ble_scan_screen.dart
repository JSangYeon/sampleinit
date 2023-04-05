import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BleScanScreen extends StatefulWidget {
  const BleScanScreen({super.key});

  @override
  BleScanScreenState createState() => BleScanScreenState();
}

class BleScanScreenState extends State<BleScanScreen> {
  bool get isAndroid =>
      foundation.defaultTargetPlatform ==
      foundation.TargetPlatform.android; // 현재 기기 android 판별

  List<ScanResult> bleScanResults = []; //블루투스 스캔 결과

  // 블루투스 기능 사용 가능 여부 체크 함수
  Future<bool> checkBluetooth() async {
    FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

    // 블루투스 어댑터 상태 확인
    bool isAvailable = await flutterBlue.isAvailable;

    bool isBluetoothOn = await flutterBlue.isOn;
    print('isAvailable: $isAvailable');
    print('isBluetoothOn: $isBluetoothOn');

    return isAvailable;

    // if (flutterBlue.state == BluetoothState.on) {
    //   // 블루투스 기능이 켜져 있는 경우
    //   return true;
    // } else {
    //   // 블루투스 기능이 꺼져 있는 경우
    //   return false;
    // }
  }

  // 현재 Android 기기의 정보와 API 버전을 받아오는 함수
  Future<bool> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      String manufacturer = androidInfo.manufacturer; // 제조사
      String model = androidInfo.model; // 모델명
      String androidId = androidInfo.id; // Android ID
      int sdkInt = androidInfo.version.sdkInt; // API 버전

      print('Manufacturer: $manufacturer');
      print('Model: $model');
      print('Android ID: $androidId');
      print('API Version: $sdkInt');
      return true;
    } else {
      print('현재 기기는 Android이 아닙니다.');
      return false;
    }
  }

  Future<void> bleStartScan() async {
    FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;

    print('Ble Start Scan');

    flutterBluePlus.scanResults.listen((results) {
      print('Ble Scan Result : ${results}');
      setState(() {
        bleScanResults = results;
      });
    });

    await flutterBluePlus.startScan(
        scanMode: ScanMode(1),
        allowDuplicates: true,
        timeout: Duration(seconds: 5));

    print('Ble Stop Scan');
    flutterBluePlus.stopScan();
  }

  Future<bool> requestPermissions() async {
    // 블루투스 지원여부, SDK 버전 확인 필요
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.location
    ].request();

    return statuses[Permission.bluetoothConnect] == PermissionStatus.granted &&
        statuses[Permission.bluetoothScan] == PermissionStatus.granted &&
        statuses[Permission.location] == PermissionStatus.granted;
    if (statuses[Permission.bluetoothConnect] == PermissionStatus.granted &&
        statuses[Permission.bluetoothScan] == PermissionStatus.granted) {
      debugPrint("블루투스 스캔 퍼미션 허용");
    } else {
      debugPrint("블루투스 스캔 퍼미션 미허용");
    }
  }

  Future<bool> checkPermission() async {
    bool isBleAble = await checkBluetooth(); // BLE 사용 가능 Device Check
    bool isBleDeviceSdk = await getDeviceInfo(); // BLE 사용 가능 SDK Version Check

    if (!isBleAble || !isBleDeviceSdk) return false; // BLE 사용 불가능하면 return

    var bluetoothConnectStatus = await Permission.bluetoothConnect.status;
    var bluetoothScanStatus = await Permission.bluetoothScan.status;

    if (bluetoothConnectStatus.isGranted && bluetoothScanStatus.isGranted) {
      debugPrint(
          "블루투스 스캔 퍼미션 허용  ${bluetoothConnectStatus.isGranted && bluetoothScanStatus.isGranted}");
    } else {
      debugPrint(
          "블루투스 스캔 퍼미션 미허용  ${bluetoothConnectStatus.isGranted && bluetoothScanStatus.isGranted}");
    }

    return await requestPermissions();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BleScanScreen'.tr()),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text('bleScan'.tr()),
              onPressed: () {
                if (isAndroid) {
                  //클릭 시 Bluetooth 권한 체크
                  debugPrint("isAndroid $isAndroid");
                  checkPermission().then((value) async {
                    if (value) {
                      debugPrint("value : $value");
                      bleStartScan();
                    }
                  });
                }
              },
            ),
            ElevatedButton(
              child: Text('languageChoiceScreen'.tr()),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 400,
              child: ListView(
                children: bleScanResults
                    .map((item) => Text(
                          item.device.id.toString(),
                          style: TextStyle(fontSize: 12),
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
