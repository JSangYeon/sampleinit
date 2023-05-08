import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RestApiTestWidget extends StatefulWidget {
  const RestApiTestWidget({super.key});

  @override
  RestApiTestState createState() => RestApiTestState();
}

class RestApiTestState extends State<RestApiTestWidget> {
  String _responseBody = '';

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('https://naver.com'));
    // final responseBody = json.decode(response.body);
    print("responsebody : ${response.body}");
    setState(() {
      _responseBody = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _fetchData,
          child: Text('Fetch Data'),
        ),
        SizedBox(height: 20),
        Text('Response Body:'),
        SizedBox(height: 10),
        Text(_responseBody),
      ],
    );
  }
}