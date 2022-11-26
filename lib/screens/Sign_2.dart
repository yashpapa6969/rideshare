import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'otp_verify.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return
      Scaffold(
        backgroundColor: const Color(0xff252525),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xfffe7c1f),
                                fontSize: 40,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: const Image(
                                    width: 40,
                                    height: 40,
                                    image:
                                    AssetImage("assets/exit.png"))),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Return right where you left off",
                        style: TextStyle(
                          color: Color(0xffd1d1d1),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: height / 8,
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            "Phone no.",
                            style: TextStyle(
                              color: Color(0xffd9d9d9),
                              fontSize: 16,
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
                          keyboardType: TextInputType.number,


                          decoration: const InputDecoration(
                            border: OutlineInputBorder(     borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),

                            fillColor: Color(0xffd9d9d9),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: width * 0.90,
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
                                  context, MaterialPageRoute(builder: (context) =>  Verify()));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 71.13,
                                child: const Text(
                                  "Get otp",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )),
                          )),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),

    );
  }
}
