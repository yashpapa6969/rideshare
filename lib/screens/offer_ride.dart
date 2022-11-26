import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rideshare/DataHandler/appData.dart';
import 'package:rideshare/screens/appointments.dart';
import 'package:rideshare/screens/searchScreen.dart';
import 'package:rideshare/widgets/Divider.dart';

class Offer extends StatefulWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppData>(context);
    List<String> time = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "10",
      "11",
      "12"
    ];
    List<String> format = ["AM", "PM"];
    List<String> passengers = ["1", "2", "3"];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
             Container(
                    height: height*0.40,
                    width: width*0.90,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6.0),
                          const Text("Hi there,", style: TextStyle(fontSize: 12.0),),
                          const Text("Where to?", style: TextStyle(fontSize: 20.0, fontFamily: "Brand Bold"),),
                          const SizedBox(height: 20.0),

                          GestureDetector(
                            onTap: () async
                            {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));


                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 6.0,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.7, 0.7),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.search, color: Colors.blueAccent,),
                                    const SizedBox(width: 10.0,),
                                    const Text("Search Drop Off"),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              const Icon(Icons.home, color: Colors.grey,),
                              const SizedBox(width: 12.0,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Provider.of<AppData>(context).pickUpLocation != null
                                          ? Provider.of<AppData>(context).pickUpLocation.placeName
                                          : "Add Home",overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4.0,),
                                    const Text("Your living home address", style: TextStyle(color: Colors.black54, fontSize: 12.0),),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10.0),

                          DividerWidget(),

                          const SizedBox(height: 16.0),

                          Row(
                            children: [
                              const Icon(Icons.work, color: Colors.grey,),
                              const SizedBox(width: 12.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Add Work"),
                                  const SizedBox(height: 4.0,),
                                  const Text("Your office address", style: TextStyle(color: Colors.black54, fontSize: 12.0),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                    const Text(
                      "Time",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    Container(
                      height: 40,
                      width: width * 0.18,
                      decoration: BoxDecoration(
                        color: const Color(0xfffe7c1f),
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          buttonPadding:
                              const EdgeInsets.only(left: 8, right: 8),
                          alignment: AlignmentDirectional.centerStart,
                          //   borderRadius: BorderRadius.circular(12),
                          //   color: ConstantColors.mainColor,
                          // ),
                          buttonHeight: 20,
                          buttonWidth: 60,
                          itemHeight: 35,
                          dropdownMaxHeight: height * 0.60,
                          value: "1",
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                          onChanged: (newValue) {},
                          items: time.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(value,
                                    style: const TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.black,
                                      fontSize: 17,
                                    )),
                              ]),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                   const Text(
                     " Am/Pm:  ",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                     ),
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
                         buttonPadding:
                         const EdgeInsets.only(left: 8, right: 8),
                         alignment: AlignmentDirectional.centerStart,
                         //   borderRadius: BorderRadius.circular(12),
                         //   color: ConstantColors.mainColor,
                         // ),
                         buttonHeight: 20,
                         buttonWidth: 60,
                         itemHeight: 35,
                         dropdownMaxHeight: height * 0.60,
                         value: "AM",
                         icon: const Icon(Icons.arrow_drop_down,
                             color: Colors.white),
                         onChanged: (newValue) {},
                         items: format.map((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Row(children: [
                               const SizedBox(
                                 width: 5,
                               ),
                               Text(value,
                                   style: const TextStyle(
                                     fontFamily: "regular",
                                     color: Colors.black,
                                     fontSize: 17,
                                   )),
                             ]),
                           );
                         }).toList(),
                       ),
                     ),
                   ),

                  ])

              ),
              const Text(
                "Passenger",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              Container(
                height: 40,
                width: width * 0.40,
                decoration: BoxDecoration(
                  color: const Color(0xfffe7c1f),
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    buttonPadding:
                    const EdgeInsets.only(left: 8, right: 8),
                    alignment: AlignmentDirectional.centerStart,
                    //   borderRadius: BorderRadius.circular(12),
                    //   color: ConstantColors.mainColor,
                    // ),
                    buttonHeight: 20,
                    buttonWidth: 60,
                    itemHeight: 35,
                    dropdownMaxHeight: height * 0.60,
                    value: "1",
                    icon: const Icon(Icons.arrow_drop_down,
                        color: Colors.white),
                    onChanged: (newValue) {},
                    items: passengers.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(value,
                              style: const TextStyle(
                                fontFamily: "regular",
                                color: Colors.black,
                                fontSize: 17,
                              )),
                        ]),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffff9040),),
                    onPressed: () async{



                      // Sign the user in (or link) with the credential
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Upcoming()));




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
        ),
      ),
    );
  }
}
