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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'KT',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
          leadingWidth: 50,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
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
                top: 0,
                left: 175,
                child: Container(
                  color: Colors.transparent,
                  child: Icon(Icons.lock),
                ),
              ),
              Positioned(
                top: 70,
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
                top: 135,
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
            ],
          ),
        ),
      ),
    );
  }
}
