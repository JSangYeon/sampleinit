import 'package:flutter/material.dart';

import 'SecondScreen.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = 'chandongi'.tr();

    return Scaffold(

      appBar: AppBar(
        // hello 라는 키를 이용해 언어에 맞는 문자열로 변환
        title: Text('hello').tr(),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Go to Second Screen'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/second');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SecondScreen()),
                // );
              },
            ),

            // name이라는 키를 이용해 언어에 맞는 문자열로 변환
            Text(tr('name')),

            // args를 이용해 변환되는 문자열에 변수 추가
            Text('myNameIs'.tr(args: [name])),

            // namedArgs 를 이용해 변수에 이름 지정
            Text('namedArgs'.tr(namedArgs: {'name': name})),

            // args + namedArgs 테스트
            Text('argsWithNamedArgs'.tr(
                args: [name, '${name}2'], namedArgs: {'name': 'named $name'})),

            // gender 기능 테스트
            Text('mode'.tr(gender: 'mode1', args: [name])),
            Text('mode'.tr(gender: 'mode2', args: [name])),
            Text('mode'.tr(gender: 'mode3', args: [name])),

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
        ),
      ),
    //   appBar: AppBar(
    //     // hello 라는 키를 이용해 언어에 맞는 문자열로 변환
    //   title: Text('hello').tr(),
    // ),
    //   body: Center(
    //     child: ElevatedButton(
    //       child: Text('Go to Second Screen'),
    //       onPressed: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => SecondScreen()),
    //         );
    //       },
    //     ),
    //   ),
    );
  }
}