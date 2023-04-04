import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/foundation.dart' as foundation;
import 'package:permission_handler/permission_handler.dart';

class BleScanScreen extends StatelessWidget {
  const BleScanScreen({super.key});

  bool get isAndroid =>foundation.defaultTargetPlatform == foundation.TargetPlatform.android;

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [      Permission.bluetoothConnect,      Permission.bluetoothScan,    ].request();
    if (statuses[Permission.bluetoothConnect] == PermissionStatus.granted && statuses[Permission.bluetoothScan] == PermissionStatus.granted) {
      debugPrint("블루투스 스캔 퍼미션 허용");
    } else {
      debugPrint("블루투스 스캔 퍼미션 미허용");
    }
  }

  Future<bool> checkPermission() async {
    var bluetoothConnectStatus = await Permission.bluetoothConnect.status;
    var bluetoothScanStatus = await Permission.bluetoothScan.status;
    if (bluetoothConnectStatus.isGranted && bluetoothScanStatus.isGranted) {
      debugPrint("블루투스 스캔 퍼미션 허용  ${bluetoothConnectStatus.isGranted && bluetoothScanStatus.isGranted}");
      return true;
    } else {
      debugPrint("블루투스 스캔 퍼미션 미허용  ${bluetoothConnectStatus.isGranted && bluetoothScanStatus.isGranted}");
      return false;
    }
  }


  @override
  Widget build(BuildContext context)  {
    if (isAndroid) {
      debugPrint("isAndroid $isAndroid");
      checkPermission().then((value) {
        if (!value) {
          requestPermissions();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SampleWidgetScreen'.tr()),
      ),
      body:
        ElevatedButton(
          child: Text('languageChoiceScreen'.tr()),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    );
  }
}