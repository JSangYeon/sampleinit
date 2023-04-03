import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ColorUtil {
  static Future<Color> getColor(String colorName) async {

    debugPrint("getColor : $colorName" );
    final jsonStr = await rootBundle.loadString('assets/colors.json');
    debugPrint("getColor jsonStr : $jsonStr" );
    final colorMap = json.decode(jsonStr) as Map<String, dynamic>; //colors.json 전체
    final colorData = colorMap[colorName] as Map<String, dynamic>; //color.json에서 colorName으로 데이터 검색
    final red = colorData['red'] as int;
    final green = colorData['green'] as int;
    final blue = colorData['blue'] as int;

    return Color.fromARGB(255, red, green, blue);
  }

}
