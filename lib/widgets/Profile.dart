
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


XFile? _pickedFile;
CroppedFile? _croppedFile;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  static var _isInit = true;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
                        final pickedFile = await _picker.pickImage(
                            source: ImageSource.camera,
                            maxHeight: 500,
                            maxWidth: 500,
                            imageQuality: 50);
                        CroppedFile? croppedFile = await ImageCropper().cropImage(
                          sourcePath: pickedFile!.path,
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
                            IOSUiSettings(
                              title: 'Cropper',
                            ),
                            WebUiSettings(
                              context: context,
                            ),
                          ],
                        );



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


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Color(0xff1f1d1d),
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Row(
                    children: [

                      Container( decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                        child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                          onPressed: (){
                          Navigator.pop(context);
                          }, child: const Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff6e80b),
                            fontSize: 12,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),),
                      )


                    ],
                  ),
                ],
              ),
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 115,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image(
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            image: Image
                                .asset('assets/icons/Filled Circle.png')
                                .image,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () async {
                              _settingModalBottomSheet();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:const Color.fromRGBO(246, 232, 11, 1),                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: ImageIcon(
                                    Image
                                        .asset('assets/icons/photo_camera.png')
                                        .image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [SizedBox(width: width*0.35,),
                Container(alignment: Alignment.center,
                  child: const Text(
                    "Akash Ranjiv",
                    style: TextStyle(
                      color: Color(0xff1f1d1d),
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: width*0.20,),
                GestureDetector(onTap: (){},
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Color(0xffe68c44),
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.80,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Color(0xff1f1d1d),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        "akasjranjiv@gmail.com",
                        style: TextStyle(
                          color: Color(0xff1f1d1d),
                          fontSize: 14,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(indent: 4,),
                      Opacity(
                        opacity: 0.80,
                        child: Text(
                          "Mobile Number",
                          style: TextStyle(
                            color: Color(0xff1f1d1d),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        "90652 30142",
                        style: TextStyle(
                          color: Color(0xff1f1d1d),
                          fontSize: 14,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )),
            ),

          ]
        ),
      )
    );
  }
}
