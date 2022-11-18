import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

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
    String? getDay = Week[DateFormat('E').format(now)];
    String dateStr = DateFormat(getDay! + '요일').format(now);
    return dateStr;
  }

  var Week = {
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/wallpaper.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Text(
                  'KT',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 5,
                child: Row(
                  children: [
                    Icon(Icons.bluetooth, size: 15),
                    SizedBox(width: 3),
                    Icon(Icons.wifi_tethering, size: 15),
                    SizedBox(width: 3),
                    Text('LTE',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                    Text('56%', style: TextStyle(fontSize: 12)),
                    Icon(Icons.battery_4_bar, size: 15),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 175,
                child: Container(
                  color: Colors.transparent,
                  child: Icon(Icons.lock),
                ),
              ),
              Positioned(
                top: 110,
                left: 125,
                child: Container(
                  color: Colors.transparent,
                  child: TimerBuilder.periodic(
                    Duration(seconds: 1),
                    builder: (context) {
                      return Text(
                        getSystemTime(),
                        style: TextStyle(
                          fontSize: 60,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 175,
                left: 135,
                child: Container(
                  color: Colors.transparent,
                  child: TimerBuilder.periodic(
                    Duration(seconds: 1),
                    builder: (context) {
                      return Text(
                        getSystemDate() + ' ' + getWeek(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      );
                    },
                  ),
                ),
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
              Positioned(
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
              Positioned(
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
      ),
    );
  }
}
