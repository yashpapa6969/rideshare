import 'package:flutter/material.dart';

class HomeModel with ChangeNotifier {
  String id;
  String name;
  String burningDesire;
  String successIs;
  String inBussiness;
  String bussinessCategory;
  String mySpecialization;
  String goals;
  String residenceNow;
  String interest;
  String myFavouriteCoreValue;
  String noOfPets;
  String profileImage;


  HomeModel({
    required this.profileImage,
    required this.id,
    required this.name,
    required this.burningDesire,
    required this.successIs,
    required this.inBussiness,
    required this.bussinessCategory,
    required this.mySpecialization,
    required this.goals,
    required this.residenceNow,
    required this.interest,
    required this.myFavouriteCoreValue,
    required this.noOfPets,

  });
}
