import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rideshare/screens/Sign_2.dart';
import 'package:rideshare/screens/otp_verify.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:provider/provider.dart';

import '../provider/user_details_provider.dart';

XFile? _pickedFile;
CroppedFile? _croppedFile;

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> age = [
      "18",
      "19",
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      "30"
    ];
    List<String> gender = ["Male", "Female", "Others"];
    void _settingModalBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SizedBox(
              height: 150,
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text('Camera'),
                      onTap: () async {
                        Navigator.pop(context);
                        final pickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.camera);

                        if (pickedFile != null) {
                          final croppedFile = await ImageCropper().cropImage(
                            sourcePath: pickedFile!.path,
                            compressFormat: ImageCompressFormat.jpg,
                            compressQuality: 100,
                            uiSettings: [
                              AndroidUiSettings(
                                  toolbarTitle: 'Cropper',
                                  toolbarColor: Colors.deepOrange,
                                  toolbarWidgetColor: Colors.white,
                                  initAspectRatio:
                                      CropAspectRatioPreset.original,
                                  lockAspectRatio: false),
                              IOSUiSettings(
                                title: 'Cropper',
                              ),
                              WebUiSettings(
                                context: context,
                                presentStyle: CropperPresentStyle.dialog,
                                boundary: const CroppieBoundary(
                                  width: 520,
                                  height: 520,
                                ),
                                viewPort: const CroppieViewPort(
                                    width: 480, height: 480, type: 'circle'),
                                enableExif: true,
                                enableZoom: true,
                                showZoomer: true,
                              ),
                            ],
                          );
                        }
                      }),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedFile = await _picker.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 500,
                          maxWidth: 500,
                          imageQuality: 50);
                    },
                  ),
                ],
              ),
            );
          });
    }

    return
     Scaffold(
        backgroundColor: const Color(0xff252525),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image(
                          image: Image.asset('assets/back.png').image,
                          height: 20.0,
                          width: 20.0,
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Details",
                          style: TextStyle(
                            color: Color(0xfffe7c1f),
                            fontSize: 40,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: 100,
                width: 115,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x260081ff),
                      offset: Offset(0, 3),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        image: Image.asset('assets/icons/useers.png').image,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async {
                          _settingModalBottomSheet();
                        },
                        child: Image(
                          image: Image.asset('assets/icons/addIcon.png').image,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "YOUR PICTURE * ",
              style: TextStyle(
                color: Color(0xff8b8b8b),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Full Name *",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 16,
                    fontFamily: "Sansation",
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: const InputDecoration(
                    fillColor: Color(0xffd9d9d9),
                    filled: true,

                    border: InputBorder.none),
                onChanged: (value){
               //   ip_address,nameController.text,driver,,emailController.text,occupationController.text,hobbiesController.text,skillsController.text,interestsController.text,othersController.text)
                },

              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                "AGE*",
                style: TextStyle(
                  color: Color(0xff8b8b8b),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: width * 0.20,
                decoration: BoxDecoration(
                  color: const Color(0xfffe7c1f),
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                    alignment: AlignmentDirectional.centerStart,
                    //   borderRadius: BorderRadius.circular(12),
                    //   color: ConstantColors.mainColor,
                    // ),
                    buttonHeight: 20,
                    buttonWidth: 60,
                    itemHeight: 35,
                    dropdownMaxHeight: height * 0.60,
                    value: "18",
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    onChanged: (newValue) {},
                    items: age.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Text(value,
                                style: const TextStyle(
                                  fontFamily: "regular",
                                  color: Colors.black,
                                  fontSize: 17,
                                ))
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Gender*",
                style: TextStyle(
                  color: Color(0xff8b8b8b),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: width * 0.30,
                decoration: BoxDecoration(
                  color: const Color(0xfffe7c1f),
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                    alignment: AlignmentDirectional.centerStart,
                    //   borderRadius: BorderRadius.circular(12),
                    //   color: ConstantColors.mainColor,
                    // ),
                    buttonHeight: 20,
                    buttonWidth: 60,
                    itemHeight: 35,
                    dropdownMaxHeight: height * 0.60,
                    value: "Male",
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    onChanged: (newValue) {},
                    items: gender.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Text(value,
                                style: const TextStyle(
                                  fontFamily: "regular",
                                  color: Colors.black,
                                  fontSize: 17,
                                ))
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "liscense No*",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 16,
                    fontFamily: "Sansation",
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    fillColor: Color(0xffd9d9d9),
                    filled: true,
                    border: InputBorder.none),
                onChanged: (value){
                },

              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Interests*",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 16,
                    fontFamily: "Sansation",
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    fillColor: Color(0xffd9d9d9),
                    filled: true,
                    border: InputBorder.none),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "yellowbus@gmail.com";
                  }
                  return null;
                },
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Pets*",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 16,
                    fontFamily: "Sansation",
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    fillColor: Color(0xffd9d9d9),
                    filled: true,
                    border: InputBorder.none),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "yellowbus@gmail.com";
                  }
                  return null;
                },
              ),
            ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Skills*",
                      style: TextStyle(
                        color: Color(0xff8b8b8b),
                        fontSize: 16,
                        fontFamily: "Sansation",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        fillColor: Color(0xffd9d9d9),
                        filled: true,
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "yellowbus@gmail.com";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20,),            Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Hobbies*",
                      style: TextStyle(
                        color: Color(0xff8b8b8b),
                        fontSize: 16,
                        fontFamily: "Sansation",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        fillColor: Color(0xffd9d9d9),
                        filled: true,
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "yellowbus@gmail.com";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Occupation*",
                      style: TextStyle(
                        color: Color(0xff8b8b8b),
                        fontSize: 16,
                        fontFamily: "Sansation",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        fillColor: Color(0xffd9d9d9),
                        filled: true,
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "yellowbus@gmail.com";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                    width: width,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffff9040),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const Signup()));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 71.13,
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )),

                    )),
          ])),
        ),

    );
  }
}
