import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rideshare/utils/config.dart';


class HomeRepository {

  Future<String> fetchAndSetCountry() async {
    final url = Uri.parse('192.168.145.9:9090/baby_chain/service/newnode');
    try {
      final response = await http.post(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> register(
      String ip_address,
      String name,
      bool  driver,
      String license,
      String email,
      String occupation,
      String hobbies,
      String skills,
      String interests,
      String others) async {
    final url = Uri.parse(URL + 'publicinfo');
    try {
      final response = await http.post(url, body: {
        "ip_address": ip_address,
        "name": name,
        "driver": driver,
        "lisense": license,
        "email": email,
        "occupation": occupation,
        "hobbies": hobbies,
        "skills": skills,
        "interests": interests,
        "others": others
      });

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }
}
