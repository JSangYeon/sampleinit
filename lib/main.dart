import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sampleinit/second_screen.dart';

import 'home_page.dart'; // 다국어 지원 패키지



// 메인 페이지
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); // EasyLocalization init

  runApp(
      EasyLocalization(
        // 지원 언어 리스트
          supportedLocales: supportedLocales,
          //path: 언어 파일 경로
          path: 'assets/translations',
          //fallbackLocale supportedLocales에 설정한 언어가 없는 경우 설정되는 언어
          // fallbackLocale: Locale('en', 'US'),
          startLocale: Locale('en','US'),

          //startLocale을 지정하면 초기 언어가 설정한 언어로 변경됨
          //만일 이 설정을 하지 않으면 OS 언어를 따라 기본 언어가 설정됨
          //startLocale: Locale('ko', 'KR')

        child : MyApp()
      )
  ); // 앱 구동 명령어 runApp runApp안에 들어가는 파라미터 - MainPage
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp: build() called");
    // await EasyLocalization.ensureInitialized();
    return MaterialApp(
      // 기본적으로 필요한 언어설정
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // home :  HomePage(),
      initialRoute: '/',
      routes: {
        // "/" Route로 이동하면, FirstScreen 위젯을 생성합니다.
        '/': (context) => const SafeArea(child: HomePage()), //SafeArea 적용 (statusBar)
        // "/second" route로 이동하면, SecondScreen 위젯을 생성합니다.
        '/second': (context) => const SafeArea(child: SecondScreen()), //SafeArea 적용 (statusBar)
      },
    );
  }
}

// 앱에서 지원하는 언어 리스트 변수
final supportedLocales = [
  Locale('en', 'US'),
  Locale('ko', 'KR')
];
