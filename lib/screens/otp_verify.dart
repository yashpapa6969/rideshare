import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rideshare/screens/mainClass.dart';

class Verify extends StatefulWidget {
  final String? phoneNumber;

  const Verify({Key? key,required this.phoneNumber}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
          backgroundColor:const Color(0xff252525),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Image(
                            image: Image.asset('assets/back.png').image,
                            height: 20.0,
                            width: 20.0,
                          ),
                        ),
                      ),
                    ]),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 50, bottom: height / 4),
                    height: height,
                    width: width,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0x1ed5d5d5),
                      ),
                      child: Column(
                        children:[
                          const SizedBox(height: 20,),
                          Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "ENTER \nOTP",
                            style: TextStyle(
                              color: Color(0xfffe7c1f),
                              fontSize: 40,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          )

                        ),


                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "We’ve sent an Phone no with your code to\n +91 XXXXXXXX",
                      style: TextStyle(
                        color:Color(0xfffe7c1f),
                        fontSize: 16,
                      ),
                    ),

                  ),
                  const SizedBox(height: 50,),

                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(

                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',

                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return "I'm from validator";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            activeColor: const Color(0xfffffde7),
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: const Color(0xfffffde7),
                            inactiveFillColor: const Color(0xfffffde7),
                            inactiveColor: const Color(0xfffffde7),
                            selectedFillColor: const Color(0xfffffde7),
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
// onTap: () {
//   print("Pressed");
// },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
//if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                  Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn’t receive an email?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffe7c1f),
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () => snackBar("OTP resend!!"),
                        child: const Text(
                          "RESEND",
                          style: TextStyle(
                              color: Color(0xFF91D3B3),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height:20),


                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                            width: width* 0.80,
                            height: 50,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffff9040),),
                              onPressed: () {
                                formKey.currentState!.validate();
// conditions for validating
                                if (currentText.length != 6 || currentText != "123456") {
                                  setState(() => hasError = true);
                                }
                                else if
                                ( currentText  == "123456")
                                  setState(
                                        () {
                                      hasError = false;
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MainScreen()
                                      )

                                     );

                                    },
                                  );
                              },

                              child: Container(
                                width: 71.13,
                                child: const Text(
                                  "Verify",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )),

                      ]),


                ]


                ),
              )),
]
    )
    )
          )
      )
    );
  }
}
