import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello').tr(),
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