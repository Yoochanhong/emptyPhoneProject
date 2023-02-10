import 'dart:io';
import 'package:empty_phone_project/model/radio_state_info.dart';
import 'package:empty_phone_project/screen/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StartSettingScreen extends StatefulWidget {
  const StartSettingScreen({Key? key}) : super(key: key);

  @override
  State<StartSettingScreen> createState() => _StartSettingScreenState();
}

class _StartSettingScreenState extends State<StartSettingScreen> {
  RadioStateInfo radioStateInfo = RadioStateInfo(battery: '2', company: 'KT');
  XFile? _pickedFile;

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
          const SizedBox(height: 100),
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
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              companyRadioButton('KT'),
              companyRadioButton('SKT'),
              companyRadioButton('LGU+'),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width - 200,
            height: MediaQuery.of(context).size.height - 550,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                _getGalleryImage();
              },
              child: _pickedFile == null
                  ? const Text('이미지 선택하기')
                  : Container(
                      width: MediaQuery.of(context).size.width - 200,
                      height: MediaQuery.of(context).size.height - 550,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(_pickedFile!.path)),
                            fit: BoxFit.cover),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
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
                      imageFile: _pickedFile,
                    ),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

  _getGalleryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = _pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  Widget companyRadioButton(String text) {
    return Column(
      children: [
        Text(text.toString()),
        Radio(
          value: text.toString(),
          groupValue: radioStateInfo.company,
          onChanged: (value) {
            setState(() {
              radioStateInfo.company = value!;
            });
          },
        ),
      ],
    );
  }
}
