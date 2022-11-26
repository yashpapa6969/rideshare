// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';



class City {
  City({
    required this.sno,
    required this.id,
    required this.name,
  });

  int sno;
  String id;
  String name;


}
