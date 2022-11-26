import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rideshare/widgets/enter_otp.dart';
import 'package:rideshare/widgets/give_otp.dart';
class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


      return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(padding: EdgeInsets.only(left: 30,right: 30,top: 100,bottom: height/8),
          height: height,width: width,


          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black
            ),        borderRadius: BorderRadius.circular(20),
              color: const Color(0x1ed5d5d5),

            ),


            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.zero,
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

                    width: width*0.60,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const        Color(0xffff9040),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Give()
                        )

                        );


                      },

                      child: Container(


                        width: 71.13,
                        child: const Text(
                          "Give Otp",
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
                const SizedBox(height: 30,),

                Container(
                    width: width*0.60,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const   Color(0xffd9d9d9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Enter()
                        )

                        );


                      },

                      child: Container(alignment: Alignment.center,
                          width: 71.13,
                          child: const Text(
                            "Take Otp",
                            style: TextStyle(
                              color: Color(0xffff9040),
                              fontSize: 16,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),
                    )),
              ],
            ),
          ),
        ),

    );
  }
}