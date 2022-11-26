import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:shared_preferences/shared_preferences.dart';


import '../utils/shared_preference.dart';

class Auth with ChangeNotifier {
  String token = '';
  String _id = '';
  String type = '';
  String phone = '';
  String email = '';
  String name = '';
  String selected_country_code = '+60';
  String image = '';

  int loginStatus = 0;
  bool mobileError = false;
  bool loading = false;
  bool otpError = false;
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  TextEditingController get mobileController => _mobileController;
  TextEditingController get otpController => _otpController;

  SharedPrefrence _saveData = SharedPrefrence();

  SharedPrefrence get saveData => _saveData;

  bool get isAuth {
    print("here" + _id != '');
    // ignore: avoid_print
    return _id.isNotEmpty && type != "register";
  }

  String get _token {
    if (token.isNotEmpty) {
      return token;
    }
    return '';
  }

  String get userId {
    return _id;
  }

  void updateLoginStatus(int status, BuildContext context) {
    if (status == 1) {
      //login(context);
    } else {
      loginStatus = status;
    }
    // loginStatus = status;

    notifyListeners();
  }

  void updateOTPStatus(BuildContext context) {
    // call varify OTP Api
  //  otpVerify(context);
    // if (otpController.text == "1234") {
    //   Navigator.popAndPushNamed(
    //     context,
    //     Register.routeName,
    //   );
    // } else {
    //   otpError = true;
    //   notifyListeners();
    // }
  }

  void updateCountryCode(String code) {
    selected_country_code = code;
    notifyListeners();
  }

  void showMobileError() {
    mobileError = true;
    notifyListeners();
  }

  void showOTPError() {
    otpError = true;
    notifyListeners();
  }


  Future<bool> tryAutoLogin() async {
    final saveData = await SharedPreferences.getInstance();
    if (!saveData.containsKey('_id')) {
      return false;
    }

    _id = saveData.getString("_id")!;

    notifyListeners();
    return true;
  }
}
