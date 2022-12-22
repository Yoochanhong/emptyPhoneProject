import 'dart:io';

import 'package:empty_phone_project/model/radio_state_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, required this.radioStateInfo, this.imageFile})
      : super(key: key);
  final RadioStateInfo radioStateInfo;
  File? imageFile;

  String getSystemTime() {
    DateFormat dateFormat = DateFormat("h:mm");
    String dateTime = dateFormat.format(DateTime.now());
    return dateTime;
  }

  String getSystemDate() {
    DateFormat dateFormat = DateFormat("MM월 dd일");
    String dateTime = dateFormat.format(DateTime.now());
    return dateTime;
  }

  String getWeek() {
    DateTime now = DateTime.now();
    String? getDay = week[DateFormat('E').format(now)];
    String dateStr = DateFormat('${getDay!}요일').format(now);
    return dateStr;
  }

  var week = {
    'Sun': '일',
    'Mon': '월',
    'Tue': '화',
    'Wed': '수',
    'Thu': '목',
    'Fri': '금',
    'Sat': '토',
  };

  Map battery = {
    '2': Icons.battery_2_bar,
    '4': Icons.battery_4_bar,
    '5': Icons.battery_5_bar,
    'std': Icons.battery_std,
  };

  Map batteryPercentState = {
    Icons.battery_2_bar: '34%',
    Icons.battery_4_bar: '56%',
    Icons.battery_5_bar: '68%',
    Icons.battery_std: '98%',
  };

  dynamic batteryStateInfo() {
    dynamic batteryState = battery[radioStateInfo.battery];
    return batteryState;
  }

  dynamic batteryPercentInfo() {
    dynamic batteryPercent = batteryPercentState[batteryStateInfo()];
    return batteryPercent;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              if (imageFile == null)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/wallpaper.jpeg',
                    fit: BoxFit.fill,
                  ),
                )
              else
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.file(File(imageFile!.path)),
                ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  radioStateInfo.company,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Row(
                  children: [
                    const Icon(Icons.bluetooth, size: 15),
                    const SizedBox(width: 2),
                    const Icon(Icons.place, size: 15),
                    const SizedBox(width: 2),
                    const Text('LTE',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 3),
                    const Icon(Icons.signal_cellular_alt, size: 15),
                    const SizedBox(width: 3),
                    Text(batteryPercentInfo(),
                        style: const TextStyle(fontSize: 12)),
                    Icon(batteryStateInfo(), size: 15),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      color: Colors.transparent,
                      child: const Icon(Icons.lock),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 100),
                      color: Colors.transparent,
                      child: TimerBuilder.periodic(
                        const Duration(seconds: 1),
                        builder: (context) {
                          return Text(
                            getSystemTime(),
                            style: const TextStyle(
                              fontSize: 60,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.transparent,
                      child: TimerBuilder.periodic(
                        const Duration(seconds: 1),
                        builder: (context) {
                          return Text(
                            '${getSystemDate()} ${getWeek()}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 15,
                left: 20,
                child: Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 22,
                left: 27,
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 15,
                right: 20,
                child: Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 22,
                right: 27,
                child: Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
