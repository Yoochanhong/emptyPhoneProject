import 'dart:io';
import 'package:empty_phone_project/model/radio_state_info.dart';
import 'package:empty_phone_project/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_cropper/image_cropper.dart';

class StartSettingScreen extends StatefulWidget {
  const StartSettingScreen({Key? key}) : super(key: key);

  @override
  State<StartSettingScreen> createState() => _StartSettingScreenState();
}

class _StartSettingScreenState extends State<StartSettingScreen> {
  RadioStateInfo radioStateInfo = RadioStateInfo(battery: '2', company: 'KT');
  XFile? _pickedFile;
  CroppedFile? _croppedFile;

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
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _getGalleryImage();
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: ClipRRect(
                    child: _pickedFile == null
                        ? const SizedBox(
                            height: 200,
                            width: 120,
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width - 200,
                            height: MediaQuery.of(context).size.height - 500,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(
                                    File(_pickedFile!.path),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                  ),
                ),
              ),
              _pickedFile == null
                  ? const SizedBox.shrink()
                  : ElevatedButton(
                      onPressed: () {
                        _cropImage();
                      },
                      child: const Icon(Icons.crop),
                    ),
            ],
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

  Future<void> _getGalleryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
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

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }
}
