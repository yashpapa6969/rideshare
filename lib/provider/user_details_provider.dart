import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rideshare/models/user_model.dart';
import 'package:rideshare/repo/homerepo.dart';
import 'package:rideshare/screens/mainClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier{
  final HomeRepository _homeRepo = HomeRepository();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController driverController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _liscenseController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();
  final TextEditingController _othersController = TextEditingController();




  TextEditingController get nameController => _nameController;
  TextEditingController get liscenseController => _liscenseController;
  TextEditingController get emailController => _emailController;
  TextEditingController get hobbiesController => _hobbiesController;
  TextEditingController get occupationController => _occupationController;
  TextEditingController get skillsController => _skillsController;
  TextEditingController get interestsController => _interestsController;
  TextEditingController get othersController => _othersController;

  String ip_address='192.168.145.175';
  List<String> address= [ "d6278c1c1349a3b6b84c95953b32894b0a4931dd89a1d7b946a0dee524ab846a161e3d47a6f9a819226d8f93b05ba5b1bac680654b187d3583d1666f12167cd0",
    "a6ae56e03c2f2fa97e742c4e65c74215a73b1c26aa283320789855890b63aa71"];

  String name='';
  bool driver = false;
  String license='';
  String email='';
  String occupation='';
  String hobbies='';
  String skills='';
  String interests='';
  String others='';
  List<UserDetails> _user_items = [];

  List<UserDetails> get countryItems {
    return [..._user_items];
  }
  HomeRepository get homeRepo => _homeRepo;

  Future<void> register(BuildContext context) async {
    // Navigator.popAndPushNamed(
    //   context,
    //   MainScreen.routeName,
    // );
      await _homeRepo.register(ip_address,nameController.text,driver,liscenseController.text,emailController.text,occupationController.text,hobbiesController.text,skillsController.text,interestsController.text,othersController.text)
          .then((response) async {
        final responseData = json.decode(response);
        print(responseData);
        print(responseData[""]);
        await SharedPreferences.getInstance().then((prefs) {
          // prefs.setString('_, _id);
          prefs.setStringList("", address);



        });
      });
    }
    notifyListeners();
  }
