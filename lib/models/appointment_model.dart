import 'package:flutter/material.dart';
class Appointment with ChangeNotifier{
  String name;
  String image;
  String origin;
  String destination;
  String time;
  String Bids;
  Appointment({required this.image,required this.destination,required this.name,required this.origin,required this.time,required this.Bids});
}

