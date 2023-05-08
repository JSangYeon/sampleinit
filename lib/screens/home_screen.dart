import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleinit/widgets/drawer_widget.dart';
import 'package:sampleinit/widgets/test_widget.dart';

import '../widgets/color_text_widget.dart';
import '../widgets/flutter_logo_widget.dart';
import '../widgets/rest_api_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
// hello 라는 키를 이용해 언어에 맞는 문자열로 변환
          title: Text('languageChoiceScreen'.tr()),
        ),
        drawer: DrawerWidget(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ProviderScope(child: TestWidget()),
              RestApiTestWidget(),
              // 내일 해당 Row 커스텀뷰로 빼서 정리해 볼 것
              Row(
                  //ROW 1
                  children: const [
                    FlutterLogoWidget(strLogoColor: 'red'),
                    FlutterLogoWidget(strLogoColor: 'sky-blue'),
                    FlutterLogoWidget(strLogoColor: 'yellow'),
                  ]),
              Align(
                  alignment: Alignment.centerLeft, // column 안에서 해당 view 왼쪽정렬
                  child: ElevatedButton(
                    child: Text('BleScanScreen'.tr()),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                  )),
              Align(
                alignment: Alignment.centerLeft, // column 안에서 해당 view 왼쪽정렬
                child: ColoredTextWidget(text: tr('name'), colorName: 'green'),
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(5.0),
                      child: OutlinedButton.icon(
                        // 언어 설정
                        onPressed: () {
                          // 한국어로 언어 변경
                          // 이후 앱을 재시작하면 한국어로 동작
                          EasyLocalization.of(context)!
                              .setLocale(Locale('ko', 'KR'));
                        },
                        icon: Icon(Icons.language_outlined),
                        label: Text(
                          'korean'.tr(),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // 영어로 언어 변경
                        // 이후 앱을 재시작하면 영어로 동작
                        EasyLocalization.of(context)!
                            .setLocale(Locale('en', 'US'));
                      },
                      icon: Icon(Icons.language_outlined),
                      label: Text(
                        'english'.tr(),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 5.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // 설정한 언어 삭제
                          // 이후 앱을 재시작하면 OS에 적용된 언어로 시작
                          EasyLocalization.of(context)!.deleteSaveLocale();
                        },
                        icon: Icon(Icons.language_outlined),
                        label: Text(
                          'clear'.tr(),
                        ),
                      )),
                ],
              )
            ]));
  }
}
