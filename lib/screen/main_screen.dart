import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:empty_phone_project/model/radio_state_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.radioStateInfo, this.imageFile})
      : super(key: key);
  final RadioStateInfo radioStateInfo;
  XFile? imageFile;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Battery battery = Battery();
  Future? batteryLevel;

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

  @override
  void initState() {
    super.initState();
    batteryLevel = getBatteryLevel();
  }

  Future getBatteryLevel() async {
    final batteryLevel = await battery.batteryLevel;
    return batteryLevel;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: FutureBuilder(
        future: batteryLevel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Stack(
                  children: [
                    widget.imageFile == null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Image.asset(
                              'assets/wallpaper.jpeg',
                              fit: BoxFit.fill,
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Image.file(File(widget.imageFile!.path),
                                fit: BoxFit.fill),
                          ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                        widget.radioStateInfo.company,
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
                          Text('${snapshot.data}%'),
                          //style: const TextStyle(fontSize: 12)),
                          //Icon(batteryStateInfo(), size: 15),
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
