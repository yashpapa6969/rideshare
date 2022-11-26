import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'take_ride.dart';
import 'offer_ride.dart';

import 'package:provider/provider.dart';


class Ride extends StatefulWidget {
  const Ride({Key? key}) : super(key: key);

  @override
  State<Ride> createState() => _RideState();
}

class _RideState extends State<Ride> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
      body:
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 30,
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                onTap: (value) {
                  print(value);
                },
                // give the indicator a decoration (color and border radius)
                indicatorColor: Colors.red,
                labelColor: Colors.grey,
                indicatorWeight: 3,
                indicatorPadding: const EdgeInsets.only(top: 5, left: 25, right: 25),
                unselectedLabelColor: Colors.red.withOpacity(0.6),
                tabs: const [
                  Tab(
                    text: 'Take A Ride',
                  ),
                  Tab(
                    text: 'Offer A Ride',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child:  Take(),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child:  Offer(),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }
}
