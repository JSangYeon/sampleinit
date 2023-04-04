import 'package:flutter/material.dart';
import 'package:sampleinit/utils/color_util.dart';

class FlutterLogoWidget extends StatefulWidget {

  final String strLogoColor;

  const FlutterLogoWidget({
    Key? key,
    required this.strLogoColor,
    //반드시 파라미터로 있어야하면 required 필요
  }) : super(key: key);

  @override
  FlutterLogoWidgetState createState() => FlutterLogoWidgetState();
}

class FlutterLogoWidgetState extends State<FlutterLogoWidget> {
  Color? logoColor;
  Color defaultBackgroundColor = Colors.grey; // 기본색상 정의

  /*
    현재 뷰에 보이는 색상
   */
  Color? currentLogoColor;

  @override
  void initState() {
    super.initState();
    currentLogoColor = defaultBackgroundColor;
    ColorUtil.getColor(widget.strLogoColor).then((color) {
      setState(() {
        logoColor = color;
        currentLogoColor = logoColor;
        debugPrint("setState: color: $logoColor");
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return
      InkWell(
        onTap: () {
          setState(() {
            currentLogoColor = currentLogoColor == logoColor ? defaultBackgroundColor : logoColor;
          });
        },
        child: Container(
          color: currentLogoColor,
          margin: EdgeInsets.all(25.0),
          child: FlutterLogo(
            size: 60.0,
          ),
        ),
      );
  }
}