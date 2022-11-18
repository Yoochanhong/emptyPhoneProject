import 'package:flutter/material.dart';

enum Battery { low, middle, high, full }
enum Company { KT, SKT, LG }


class StartSettingScreen extends StatefulWidget {
  const StartSettingScreen({Key? key}) : super(key: key);

  @override
  State<StartSettingScreen> createState() => _StartSettingScreenState();
}

class _StartSettingScreenState extends State<StartSettingScreen> {
  Battery? battery = Battery.low;
  Company? company = Company.KT;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('KT'),
                  Radio<Company>(value: Company.KT, groupValue: company, onChanged: (Company? value){
                    setState(() {
                      company = value;
                    });
                  }),
                ],
              ),
              Column(
                children: [
                  Text('SKT'),
                  Radio<Company>(value: Company.SKT, groupValue: company, onChanged: (Company? value){
                    setState(() {
                      company = value;
                    });
                  }),
                ],
              ),
              Column(
                children: [
                  Text('LGU+'),
                  Radio<Company>(value: Company.LG, groupValue: company, onChanged: (Company? value){
                    setState(() {
                      company = value;
                    });
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
