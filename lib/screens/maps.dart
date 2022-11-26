import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rideshare/Assistants/assistantMethods.dart';
import 'package:rideshare/DataHandler/appData.dart';
import 'package:rideshare/models/directDetails.dart';
import 'package:rideshare/screens/home.dart';
import 'package:rideshare/screens/take_ride.dart';
import 'package:rideshare/widgets/progressDialog.dart';


import 'offer_ride.dart';
class Item {
  const Item(this.name, this.img1, this.img2);
  final String name;
  final String img1;
  final String img2;
}
Set<Marker> markersSet = {};
Set<Circle> circlesSet = {};
List<LatLng> pLineCoordinates = [];
Set<Polyline> polylineSet = {};



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample>with TickerProviderStateMixin {



  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapContoller;

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  late TabController _tabController;

 late DirectionDetails tripDirectionDetails;
  List<Item> carType = <Item>[
    Item('Car', 'lib/assets/images/budget-active.png', 'lib/assets/images/car-deactive.png'),
    Item('Budget', 'lib/assets/images/budget-active.png', 'lib/assets/images/budget-deactive.png'),
    Item('Tuk Tuk', 'lib/assets/images/tuk-tuk-active.png', 'lib/assets/images/tuk-tuk-deactive.png'),
    Item('City', 'lib/assets/images/city-active.png', 'lib/assets/images/city-deactive.png'),
    Item('Van', 'lib/assets/images/van-active.png', 'lib/assets/images/van-deactive.png'),
  ];
  int type = 0;
  double deviceHeight = 0;
  double deviceWidth = 0;



  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
   var deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
   var deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    DirectionDetails tripDirectionDetails;

    late GoogleMapController newGoogleMapController;

    Position currentPosition;
    var geoLocator = Geolocator();
    void locatePosition() async
    {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentPosition = position;

      LatLng latLatPosition = LatLng(position.latitude, position.longitude);

      CameraPosition cameraPosition = new CameraPosition(target: latLatPosition, zoom: 14);
      newGoogleMapContoller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      String address = await AssistantMethods.searchCoordinateAddress(position,context);
      print("This is your Address :: " +address);



    }
    Completer<GoogleMapController> _controllerGoogleMap = Completer();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
      backgroundColor:  Colors.white,
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white
          ),
          child: Row(
            children: List.generate(carType.length, (index) {
              return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        type = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(carType[index].name,
                            style: TextStyle(
                                fontSize: 14,
                                color: type == index ? Color.fromARGB(255,94, 95, 102) : Color.fromARGB(255,204, 204, 204)
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: Image(
                              image: index == type ? AssetImage(carType[index].img1) : AssetImage(carType[index].img2),
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              );
            }),
          ),
        ),


              Container(height: height*0.60,
              child: GoogleMap(
                zoomGesturesEnabled: true,
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                mapToolbarEnabled: true,
                polylines: polylineSet,
                markers: markersSet,
                circles: circlesSet,

                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  newGoogleMapContoller = controller;
                  locatePosition();
                },

              ),

            ),
              Positioned(child:Container(height:height*0.40,child: const Ride()) ),

          ]
          ),
        ),
      ),

    );
  }
  Future<void> getPlaceDirection() async
  {
    var initialPos = Provider
        .of<AppData>(context, listen: false)
        .pickUpLocation;
    var finalPos = Provider
        .of<AppData>(context, listen: false)
        .dropOffLocation;


    var pickUpLatLng = LatLng(initialPos.latitude, initialPos.longitude);
    var dropOffLatLng = LatLng(finalPos.latitude, finalPos.longitude);

    showDialog(
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(message: "Please wait...",)
    );

    var details = await AssistantMethods.obtainPlaceDirectionDetails(
        pickUpLatLng, dropOffLatLng);
    setState(() {
      tripDirectionDetails = details;
    });

    Navigator.pop(context);

    print("This is Encoded Points ::");
    print(details.encodedPoints);

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolyLinePointsResult = polylinePoints
        .decodePolyline(details.encodedPoints);

    pLineCoordinates.clear();

    if (decodedPolyLinePointsResult.isNotEmpty) {
      decodedPolyLinePointsResult.forEach((PointLatLng pointLatLng) {
        pLineCoordinates.add(
            LatLng(pointLatLng.latitude, pointLatLng.longitude));
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
    if (pickUpLatLng.latitude > dropOffLatLng.latitude &&
        pickUpLatLng.longitude > dropOffLatLng.longitude) {
      latLngBounds =
          LatLngBounds(southwest: dropOffLatLng, northeast: pickUpLatLng);
    }
    else if (pickUpLatLng.longitude > dropOffLatLng.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude),
          northeast: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude));
    }
    else if (pickUpLatLng.latitude > dropOffLatLng.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude),
          northeast: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude));
    }
    else {
      latLngBounds =
          LatLngBounds(southwest: pickUpLatLng, northeast: dropOffLatLng);
    }

    newGoogleMapContoller.animateCamera(
        CameraUpdate.newLatLngBounds(latLngBounds, 70));

    Marker pickUpLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      infoWindow: InfoWindow(
          title: initialPos.placeName, snippet: "my Location"),
      position: pickUpLatLng,
      markerId: MarkerId("pickUpId"),
    );

    Marker dropOffLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(
          title: finalPos.placeName, snippet: "DropOff Location"),
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