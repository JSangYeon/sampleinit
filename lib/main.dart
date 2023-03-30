import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // 다국어 지원 패키지


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      home: HomePage(),
    );
  }
}

//
//
// // 메인 페이지
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized(); // EasyLocalization init
//
//   runApp(
//       EasyLocalization(
//         // 지원 언어 리스트
//           supportedLocales: supportedLocales,
//           //path: 언어 파일 경로
//           path: 'assets/translations',
//           //fallbackLocale supportedLocales에 설정한 언어가 없는 경우 설정되는 언어
//           fallbackLocale: Locale('en', 'US'),
//
//           //startLocale을 지정하면 초기 언어가 설정한 언어로 변경됨
//           //만일 이 설정을 하지 않으면 OS 언어를 따라 기본 언어가 설정됨
//           //startLocale: Locale('ko', 'KR')
//
//           child: MyApp()),
//       // MyApp()
//   ); // 앱 구동 명령어 runApp runApp안에 들어가는 파라미터 - MainPage
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Screen'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go back to Home'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}


// 앱에서 지원하는 언어 리스트 변수
final supportedLocales = [
  Locale('en', 'US'),
  Locale('ko', 'KR')
];


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // await EasyLocalization.ensureInitialized();
//     return MaterialApp(
//       // 기본적으로 필요한 언어설정
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       home : MyHomePage()
//       // title: '샘플 레이아웃', // 앱 타이틀
//       //
//       // home: Scaffold(
//       //   appBar: AppBar(
//       //     title: Text('샘플 레이아웃'), // 앱바 타이틀
//       //   ),
//       //   body: Center(
//       //     child: Text(
//       //     'hello world!', // 화면에 표시될 텍스트
//       //     //   style: TextStyle(fontSize: 24),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }

// //파일이나 패키지 받아오는 문법 위젯 짜집기로 App작성
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       // home: Text('안녕') // 글자 위젯
//       // home: Icon(Icons.shop) // 아이콘 위젯
//       home : Image.asset('assets/autopassword.jpg', height: 140, width: 140) // 이미지 위젯 assets폴더에 이미지넣고 등록해야함 pubspec.yaml
//       // home : Container(width: 50,height: 50,color: Colors.black) //Container(), SizeBox()는 같음
//       // home: Center( // Center - 내 자식 위젯 기준점을 중앙으로 설정해주는 위젯
//         // child: Container(width: 50,height: 50,color: Colors.blue)
//       // ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // chandongi라는 키를 언에 맞는 문자열로 변환
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
    );
  }
}
