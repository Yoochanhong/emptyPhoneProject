import 'dart:io';
import 'package:empty_phone_project/model/radio_state_info.dart';
import 'package:empty_phone_project/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StartSettingScreen extends StatefulWidget {
  const StartSettingScreen({Key? key}) : super(key: key);

  @override
  State<StartSettingScreen> createState() => _StartSettingScreenState();
}

class _StartSettingScreenState extends State<StartSettingScreen> {
  RadioStateInfo radioStateInfo = RadioStateInfo(battery: '2', company: 'KT');
  File? image;
  final picker = ImagePicker();

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
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.battery_2_bar),
                  Radio(
                      value: '2',
                      groupValue: radioStateInfo.battery,
                      onChanged: (value) {
                        setState(() {
                          radioStateInfo.battery = value!;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.battery_4_bar),
                  Radio(
                      value: '4',
                      groupValue: radioStateInfo.battery,
                      onChanged: (value) {
                        setState(() {
                          radioStateInfo.battery = value!;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.battery_5_bar),
                  Radio(
                      value: '5',
                      groupValue: radioStateInfo.battery,
                      onChanged: (value) {
                        setState(() {
                          radioStateInfo.battery = value!;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.battery_std),
                  Radio(
                      value: 'std',
                      groupValue: radioStateInfo.battery,
                      onChanged: (value) {
                        setState(() {
                          radioStateInfo.battery = value!;
                        });
                      }),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('KT'),
                  Radio(
                      value: 'KT',
                      groupValue: radioStateInfo.company,
                      onChanged: (value) {
                        setState(() {
                          radioStateInfo.company = value!;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  Text('SKT'),
                  Radio(
                      value: 'SKT',
                      groupValue: radioStateInfo.company,
                      onChanged: (value) {
                        setState(() {
                          radioStateInfo.company = value!;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  Text('LGU+'),
                  Radio(
                      value: 'LGU+',
                      groupValue: radioStateInfo.company,
                      onChanged: (value) {
                        setState(() {
                          radioStateInfo.company = value!;
                        });
                      }),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Text('배경화면에 맞는 비율의 사진을 권장해요!'),
          SizedBox(
            width: MediaQuery.of(context).size.width - 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                getGalleryImage(ImageSource.gallery);
              },
              child: Text('이미지 가져오기'),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(
                      radioStateInfo: radioStateInfo,
                      imageFile: image!,
                    ),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

  Future getGalleryImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      image = File(pickedFile!.path);
    });
    print('-------------------' + image!.path);
  }
}
