import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rideshare/screens/mainClass.dart';
class Give extends StatefulWidget {
  const Give({Key? key}) : super(key: key);

  @override
  State<Give>createState() => _GiveState();
}

class _GiveState extends State<Give> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    bool hasError = false;
    String currentText = "";
    final formKey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: Image.asset('assets/bag.png').image,
                  height: height/3,
                  width: width/2,
                ),
              ),
              Center(
                child: Text(
                  "To the driver to confirm the\nbid and start the ride.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )
              ),
             SizedBox(height: 20,),
             Padding(padding: EdgeInsets.only(left: 30),
               child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: const Color(0x99c2d4ee),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Center(
                         child: Text(
                           "5",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 5,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: const Color(0x99c2d4ee),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Center(
                         child: Text(
                           "9",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 5,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: const Color(0x99c2d4ee),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Center(
                         child: Text(
                           "0",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 5,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: const Color(0x99c2d4ee),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Center(
                         child: Text(
                           "4",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 5,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: const Color(0x99c2d4ee),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Center(
                         child: Text(
                           "2",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 5,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: const Color(0x99c2d4ee),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Center(
                         child: Text(
                           "1",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 5,),
                 ],

               ),
             ),

            ],

          )
          ,
        ),
      ),
    );
  }
}
