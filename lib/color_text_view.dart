import 'package:flutter/material.dart';
import 'package:sampleinit/utils/color_util.dart';

class ColoredTextView extends StatefulWidget {
  final String text;
  final String colorName;

  const ColoredTextView({
    Key? key,
    required this.text,
    required this.colorName, //반드시 파라미터로 있어야하면 required 필요
  }) : super(key: key);

  @override
  ColoredTextViewState createState() => ColoredTextViewState();
}

class ColoredTextViewState extends State<ColoredTextView> {
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    debugPrint("initState ColoredTextView : ${widget.colorName}" );
      ColorUtil.getColor(widget.colorName).then((color) {
        setState(() {
          backgroundColor = color;
          debugPrint("setState: color: $backgroundColor");
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    const defaultBackgroundColor = Colors.grey; // 기본색상 정의
    return Container(
      width: 100, //가로
      height: 50, // 세로
      padding: EdgeInsets.all(16.0), // 패딩
      decoration: BoxDecoration( // 테두리 및  색상
        border: Border.all(color: Colors.white), //테두리 색상
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor ?? defaultBackgroundColor,
      ),
      child: Align(
        child: Text(widget.text),
      ),
    );
  }
}