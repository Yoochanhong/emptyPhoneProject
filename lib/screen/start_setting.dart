import 'package:flutter/material.dart';

enum Battery { low, middle, high, full }

class StartSettingScreen extends StatefulWidget {
  const StartSettingScreen({Key? key}) : super(key: key);

  @override
  State<StartSettingScreen> createState() => _StartSettingScreenState();
}

class _StartSettingScreenState extends State<StartSettingScreen> {
  Battery? battery = Battery.low;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.battery_2_bar),
                  Radio<Battery>(
                      value: Battery.low,
                      groupValue: battery,
                      onChanged: (Battery? value) {
                        setState(() {
                          battery = value;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.battery_4_bar),
                  Radio<Battery>(
                      value: Battery.middle,
                      groupValue: battery,
                      onChanged: (Battery? value) {
                        setState(() {
                          battery = value;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.battery_5_bar),
                  Radio<Battery>(
                      value: Battery.high,
                      groupValue: battery,
                      onChanged: (Battery? value) {
                        setState(() {
                          battery = value;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.battery_std),
                  Radio<Battery>(
                      value: Battery.full,
                      groupValue: battery,
                      onChanged: (Battery? value) {
                        setState(() {
                          battery = value;
                        });
                      }),
                ],
              ),
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
