import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  String image,
      email,
      interests,
      pets,
      hobbies,
      accomplishments,
      desires,
      skills,
      occupation,
      gender,
      age,
      name;
  Profile({
    required this.image,
    required this.email,
    required this.interests,
    required this.pets,
    required this.hobbies,
    required this.accomplishments,
    required this.desires,
    required this.skills,
    required this.occupation,
    required this.gender,
    required this.age,
    required this.name,
  });
}
