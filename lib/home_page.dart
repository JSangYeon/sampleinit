import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'color_text_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String secondScreen;
  late String name;

  @override
  void initState() {
    super.initState();
    secondScreen = 'SampleWidgetScreen'.tr();
    name = 'chandongi'.tr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
// hello 라는 키를 이용해 언어에 맞는 문자열로 변환
          title: Text('languageChoiceScreen').tr(),
        ),
        body: Column(children: <Widget>[
          Row(
            //ROW 1
            children: [
              Container(
                color: Colors.orange,
                margin: EdgeInsets.all(25.0),
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),
              Container(
                color: Colors.blue,
                margin: EdgeInsets.all(25.0),
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),
              Container(
                color: Colors.purple,
                margin: EdgeInsets.all(25.0),
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),
            ],
          ),
          Row(//ROW 2
              children: [
            Container(
              color: Colors.orange,
              margin: EdgeInsets.all(25.0),
              child: FlutterLogo(
                size: 60.0,
              ),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.all(25.0),
              child: FlutterLogo(
                size: 60.0,
              ),
            ),
            Container(
              color: Colors.purple,
              margin: EdgeInsets.all(25.0),
              child: FlutterLogo(
                size: 60.0,
              ),
            )
          ]),
          Align(
              alignment: Alignment.centerLeft, // column 안에서 해당 view 왼쪽정렬
              child: ElevatedButton(
                child: Text('Go to $secondScreen'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              )),
          Align(
            alignment: Alignment.centerLeft, // column 안에서 해당 view 왼쪽정렬
            child: ColoredTextView(text: tr('name'), colorName: 'green'),
          ),
          Row(
            children: [
              // 언어 설정
              OutlinedButton.icon(
                onPressed: () {
                  // 한국어로 언어 변경
                  // 이후 앱을 재시작하면 한국어로 동작
                  EasyLocalization.of(context)!.setLocale(Locale('ko', 'KR'));
                },
                icon: Icon(Icons.language_outlined),
                label: Text(
                  'korean'.tr(),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // 영어로 언어 변경
                  // 이후 앱을 재시작하면 영어로 동작
                  EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
                },
                icon: Icon(Icons.language_outlined),
                label: Text(
                  'english'.tr(),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // 설정한 언어 삭제
                  // 이후 앱을 재시작하면 OS에 적용된 언어로 시작
                  EasyLocalization.of(context)!.deleteSaveLocale();
                },
                icon: Icon(Icons.language_outlined),
                label: Text(
                  'clear'.tr(),
                ),
              )
            ],
          )
        ])

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //
        //   children: <Widget>[
        //     ElevatedButton(
        //       child: Text('Go to $secondScreen'),
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/second');
        //       },
        //     ),
        //     // name이라는 키를 이용해 언어에 맞는 문자열로 변환
        //     Text(tr('name')),
        //     ColoredTextView(text: tr('name'), colorName: 'green'),
        //     // args를 이용해 변환되는 문자열에 변수 추가
        //     Text('myNameIs'.tr(args: [name])),
        //     // namedArgs 를 이용해 변수에 이름 지정
        //     Text('namedArgs'.tr(namedArgs: {'name': name})),
        //     // args + namedArgs 테스트
        //     Text('argsWithNamedArgs'.tr(
        //         args: [name, '${name}2'], namedArgs: {'name': 'named $name'})),
        //     // gender 기능 테스트
        //     // Text('mode'.tr(gender: 'mode1', args: [name])),
        //     // Text('mode'.tr(gender: 'mode2', args: [name])),
        //     // Text('mode'.tr(gender: 'mode3', args: [name])),
        //     // 언어 설정
        //     OutlinedButton.icon(
        //       onPressed: () {
        //         // 한국어로 언어 변경
        //         // 이후 앱을 재시작하면 한국어로 동작
        //         EasyLocalization.of(context)!.setLocale(Locale('ko', 'KR'));
        //       },
        //       icon: Icon(Icons.language_outlined),
        //       label: Text(
        //         'korean'.tr(),
        //       ),
        //     ),
        //     OutlinedButton.icon(
        //       onPressed: () {
        //         // 영어로 언어 변경
        //         // 이후 앱을 재시작하면 영어로 동작
        //         EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
        //       },
        //       icon: Icon(Icons.language_outlined),
        //       label: Text(
        //         'english'.tr(),
        //       ),
        //     ),
        //     OutlinedButton.icon(
        //       onPressed: () {
        //         // 설정한 언어 삭제
        //         // 이후 앱을 재시작하면 OS에 적용된 언어로 시작
        //         EasyLocalization.of(context)!.deleteSaveLocale();
        //       },
        //       icon: Icon(Icons.language_outlined),
        //       label: Text(
        //         'clear'.tr(),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
