import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  String getSystemTime() {
    DateFormat dateFormat = DateFormat("h:mm");
    String _dateTime = dateFormat.format(DateTime.now());
    return _dateTime;
  }

  String getSystemDate() {
    DateFormat dateFormat = DateFormat("MM월 dd일 E요일");
    String _dateTime = dateFormat.format(DateTime.now());
    return _dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Icon(
          Icons.lock,
          color: Colors.black,
        ),
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
              top: 30,
              left: 120,
              child: Container(
                color: Colors.transparent,
                child: TimerBuilder.periodic(
                  Duration(seconds: 1),
                  builder: (context) {
                    return Text(
                      getSystemTime(),
                      style: TextStyle(
                        fontSize: 65,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 105,
              left: 133,
              child: Container(
                color: Colors.transparent,
                child: TimerBuilder.periodic(
                  Duration(seconds: 1),
                  builder: (context) {
                    return Text(
                      getSystemDate(),
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
    );
  }
}
