import 'package:flutter/material.dart';
import 'package:empty_phone_project/screen/start_setting.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartSettingScreen(),
    );
  }
}
