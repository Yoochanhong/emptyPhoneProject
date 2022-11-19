import 'package:empty_phone_project/model/radio_state_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:empty_phone_project/model/radio_state_info.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, required this.radioStateInfo}) : super(key : key);
  final RadioStateInfo radioStateInfo;

  String getSystemTime() {
    DateFormat dateFormat = DateFormat("h:mm");
    String _dateTime = dateFormat.format(DateTime.now());
    return _dateTime;
  }

  String getSystemDate() {
    DateFormat dateFormat = DateFormat("MM월 dd일");
    String _dateTime = dateFormat.format(DateTime.now());
    return _dateTime;
  }

  String getWeek() {
    DateTime now = DateTime.now();
    String? getDay = week[DateFormat('E').format(now)];
    String dateStr = DateFormat(getDay! + '요일').format(now);
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
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/wallpaper.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                radioStateInfo!.company,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Row(
                children: [
                  Icon(Icons.bluetooth, size: 15),
                  SizedBox(width: 2),
                  Icon(Icons.place, size: 15),
                  SizedBox(width: 2),
                  Text('LTE',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  SizedBox(width: 3),
                  Icon(Icons.signal_cellular_alt, size: 15),
                  SizedBox(width: 3),
                  Text('56%', style: TextStyle(fontSize: 12)),
                  Icon(Icons.battery_4_bar, size: 15),
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
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Container(
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
                ),
                Center(
                  child: Container(
                    color: Colors.transparent,
                    child: TimerBuilder.periodic(
                      const Duration(seconds: 1),
                      builder: (context) {
                        return Text(
                          getSystemDate() + ' ' + getWeek(),
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
      ),
    );
  }
}
