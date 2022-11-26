import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rideshare/main.dart';
import 'package:lottie/lottie.dart';
import 'package:rideshare/screens/slider.dart';



class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  _Splash2 createState() => _Splash2();
}

class _Splash2 extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () => Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  slider())));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const Color black = Color(0xFF000000);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: Colors.black87,
        body:  SingleChildScrollView(
            child: Container(

                child: Container(
                  margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(alignment: Alignment.bottomCenter,
                            child: const Image(
                              image: AssetImage("assets/rideshare_logo.png"),

                            ),
                            width: width/2,
                            height: height/3,
                          ),
                        ],
                      ),
                      SizedBox(height: 50,),
                      Container(
                        width: width,
                        height: height/3,
                          child:Lottie.network(
                              'https://assets9.lottiefiles.com/private_files/lf30_hsabbeks.json')
                      ),
                      SizedBox(height: 30,),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Powered by Wysteria",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                    ],
                  ),
                )),
          ),
        );
  }
}

