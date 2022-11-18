import 'package:flutter/material.dart';
import 'package:empty_phone_project/screen/main_screen.dart';
import 'package:empty_phone_project/screen/start_setting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartSettingScreen(),
    );
  }
}
