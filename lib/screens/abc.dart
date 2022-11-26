import 'package:flutter/material.dart';
import 'package:rideshare/screens/maps.dart';
class req extends StatefulWidget {
  const req({Key? key}) : super(key: key);

  @override
  State<req> createState() => _reqState();
}

class _reqState extends State<req> {
  @override

  Widget build(BuildContext context)
  {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Positioned(top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.5,
                          offset: Offset(0.7,0.7),
                        )
                      ]
                  ),
                  child:Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.tealAccent,
                        padding: EdgeInsets.all(10),

                        child: Row(
                          children: [
                            Image.asset("images/taxi.png",height: 50,width: 60,),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Text("Car",style: TextStyle(fontSize: 20,),),
                                Text("tripDirectionDetails",style: TextStyle(fontSize: 20,),)

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
