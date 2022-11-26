import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rideshare/models/profile_model.dart';
import 'package:rideshare/widgets/colorConstantsswipe.dart';

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
      statusBarColor: ConstantColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
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
                        final pickedFile = await _picker.pickImage(source: ImageSource.camera, maxHeight: 500, maxWidth: 500, imageQuality: 50);


                      }),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedFile = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500, imageQuality: 50);

                    },
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                height: 100,
                color: ConstantColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        )
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                              image: Image.network(sumukha[0].image).image,
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
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sumukha[0].name,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      height: 2,
                      color: Color(0xff000000),
                      letterSpacing: 0.168,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ConstantColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x260081ff),
                      offset: Offset(0, 3),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/cartIcon.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hobbies",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].hobbies,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  letterSpacing: 0.168,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/messageIcon.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].email,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  letterSpacing: 0.168,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/prIcon.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Interests",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  letterSpacing: 0.168,
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].interests,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/petIcon.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pets",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.6,
                                child: Text(
                                  sumukha[0].pets,
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  maxLines: 4,
                                  style: const TextStyle(
                                    fontFamily: 'regular',
                                    fontSize: 14,
                                    height: 1.3,
                                    color: Color(0xff2a2a3a),
                                    letterSpacing: 0.168,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/accompIcon.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Accomplishments",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].accomplishments,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  letterSpacing: 0.168,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/img_1.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Desires",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].desires,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  letterSpacing: 0.168,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/skillIcon.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Skills",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].skills,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  letterSpacing: 0.168,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/sponsor.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Occupation",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "regular",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].occupation,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  letterSpacing: 0.168,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0x99c2d4ee),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: ImageIcon(
                                  Image.asset('assets/icons/hobbiessIcon.png').image,
                                  color: ConstantColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hobbies",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Gender",
                                  color: ConstantColors.primaryColor.withOpacity(0.65),
                                ),
                              ),
                              Text(
                                sumukha[0].age,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                  letterSpacing: 0.168,
                                  fontFamily: "regular",
                                  color: ConstantColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.primaryColor.withOpacity(0.11),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
List<Profile> sumukha =[
  Profile(
    name: 'Arushi Jain',
    image: 'https://images.pexels.com/photos/10509825/pexels-photo-10509825.jpeg',
    email: 'arushijain@gmail.com',
    interests: 'Space, Stars',
    pets: 'Dog, cat',
    hobbies: 'Astronomy, star gazing',
    accomplishments: 'Organized a fundraiser',
    desires: 'To learn about the stars',
    skills: 'Astro-Physics, Astrology',
    occupation: 'Human Resources',
    gender: 'Female',
    age: '22',

  ),
  Profile(
    name: 'Amar gupta',
    image: 'https://images.pexels.com/photos/3772616/pexels-photo-3772616.jpeg',
    email: 'amargupta@gmail.com',
    interests: 'Phones, Android',
    pets: 'Dog',
    hobbies: 'Window shopping, Phone hunting',
    accomplishments: 'Designed an android app',
    desires: 'Finding the perfect smartphone',
    skills: 'Flutter, Adobe Illustrator',
    occupation: 'Frontend android design',
    gender: 'Male',
    age: '34',
  )

];