// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.


class IPa extends StatefulWidget {
  const IPa({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<IPa> createState() => _IPaState();
}

class _IPaState extends State<IPa> {
  String _connectionStatus = 'Unknown';
  final NetworkInfo _networkInfo = NetworkInfo();

  @override
  void initState() {
    super.initState();
    _initNetworkInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Network info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(_connectionStatus),
            ],
          )),
    );
  }

  Future<void> _initNetworkInfo() async {
    String? wifiName,


        wifiIPv4;

      wifiIPv4 = await _networkInfo.getWifiIP();




    setState(() {
      _connectionStatus = 'Wifi Name: $wifiName\n'

          'Wifi IPv4: $wifiIPv4';

    });
  }
}