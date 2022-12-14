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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                getGalleryImage(ImageSource.gallery);
              },
              child: const Text('????????? ????????????'),
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
                      imageFile: image,
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

  Future getGalleryImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      image = File(pickedFile!.path);
    });
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
