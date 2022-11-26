import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rideshare/Assistants/assistantMethods.dart';
import 'package:rideshare/Assistants/requestAssistant.dart';
import 'package:rideshare/DataHandler/appData.dart';
import 'package:rideshare/screens/maps.dart';
import 'package:rideshare/screens/searchScreen.dart';
import 'package:rideshare/widgets/Divider.dart';
import 'package:rideshare/widgets/progressDialog.dart';

import '../utils/config.dart';
class Take extends StatefulWidget {
  const Take({Key? key}) : super(key: key);

  @override
  State<Take> createState() => _TakeState();
}

class _TakeState extends State<Take> {
  @override
  Widget build(BuildContext context) {
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

    var data = Provider.of<AppData>(context);
    return Scaffold(
      backgroundColor:  Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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

                               getPlaceDirection();



                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
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
                              children: const [
                                Icon(Icons.search, color: Colors.blueAccent,),
                                SizedBox(width: 10.0,),
                                Text("Search Drop Off"),
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
                            children: const [
                              Text("Add Work"),
                              SizedBox(height: 4.0,),
                              Text("Your office address", style: TextStyle(color: Colors.black54, fontSize: 12.0),),
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
                            color: Colors.black,
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
                            color: Colors.black,
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
                  color: Colors.black,
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
            ],
          ),
        ),
      ),
    );
  }
  late GoogleMapController newGoogleMapContoller;
  Future<void> getPlaceDirection() async
  {
    var initialPos = Provider.of<AppData>(context, listen: false).pickUpLocation;
    var finalPos = Provider.of<AppData>(context, listen: false).dropOffLocation;

    var pickUpLatLng = LatLng(initialPos.latitude,initialPos.longitude);
    var dropOffLatLng = LatLng(finalPos.latitude, finalPos.longitude);

    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(message: "Please wait...",)
    );

    var details = await AssistantMethods.obtainPlaceDirectionDetails(pickUpLatLng, dropOffLatLng);
    setState(() {
      //  tripDirectionDetails = details;
    });

    Navigator.pop(context);

    print("This is Encoded Points ::");
    if (kDebugMode) {
      print(details.encodedPoints);
    }

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolyLinePointsResult = polylinePoints.decodePolyline(details.encodedPoints);

    pLineCoordinates.clear();

    if(decodedPolyLinePointsResult.isNotEmpty)
    {
      decodedPolyLinePointsResult.forEach((PointLatLng pointLatLng) {
        pLineCoordinates.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    polylineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        color: Colors.pink,
        polylineId: PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLineCoordinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polylineSet.add(polyline);
    });

    LatLngBounds latLngBounds;
    if(pickUpLatLng.latitude > dropOffLatLng.latitude  &&  pickUpLatLng.longitude > dropOffLatLng.longitude)
    {
      latLngBounds = LatLngBounds(southwest: dropOffLatLng, northeast: pickUpLatLng);
    }
    else if(pickUpLatLng.longitude > dropOffLatLng.longitude)
    {
      latLngBounds = LatLngBounds(southwest: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude), northeast: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude));
    }
    else if(pickUpLatLng.latitude > dropOffLatLng.latitude)
    {
      latLngBounds = LatLngBounds(southwest: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude), northeast: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude));
    }
    else
    {
      latLngBounds = LatLngBounds(southwest: pickUpLatLng, northeast: dropOffLatLng);
    }


    newGoogleMapContoller.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    Marker pickUpLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      infoWindow: InfoWindow(title: initialPos.placeName, snippet: "my Location"),
      position: pickUpLatLng,
      markerId: MarkerId("pickUpId"),
    );

    Marker dropOffLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: finalPos.placeName, snippet: "DropOff Location"),
      position: dropOffLatLng,
      markerId: MarkerId("dropOffId"),
    );

    setState(() {
      markersSet.add(pickUpLocMarker);
      markersSet.add(dropOffLocMarker);
    });

    Circle pickUpLocCircle = Circle(
      fillColor: Colors.blueAccent,
      center: pickUpLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.blueAccent,
      circleId: CircleId("pickUpId"),
    );

    Circle dropOffLocCircle = Circle(
      fillColor: Colors.deepPurple,
      center: dropOffLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.deepPurple,
      circleId: CircleId("dropOffId"),
    );

    setState(() {
      circlesSet.add(pickUpLocCircle);
      circlesSet.add(dropOffLocCircle);
    });
  }

}
