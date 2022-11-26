import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideshare/models/appointment_model.dart';
import 'package:rideshare/screens/profile.dart';
import 'package:rideshare/widgets/colorConstantsswipe.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      itemCount: riders.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          // builder: (c) => products[i],
          value: riders[i],
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: const [
                BoxShadow(
                  color: const Color(0x260081ff),
                  offset: Offset(0, 3),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        riders[i].name,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: ConstantColors.primaryColor,
                          letterSpacing: 0.24,
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ConstantColors.disabledBtn,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child:  Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                            },
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: ConstantColors.primaryColor,
                                height: 2,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //     width: 100,
                      //     height: 30,
                      //     child: ElevatedButton(
                      //       child: const Text(
                      //         "Reschedule",
                      //         style: TextStyle(
                      //           fontFamily: 'Roboto',
                      //           fontSize: 12,
                      //           color: ConstantColors.white,
                      //           height: 2,
                      //         ),
                      //         textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      //         softWrap: false,
                      //       ),
                      //       onPressed: () => {},
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: ConstantColors.primaryColor,
                      //       ),
                      //     )),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 10, right: 10, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: Image.network(riders[i].image).image,
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              riders[i].origin,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xcc000000),
                                fontWeight: FontWeight.w500,
                                height: 1.2307692307692308,
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              riders[i].destination,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xcc000000),
                                fontWeight: FontWeight.w500,
                                height: 1.2307692307692308,
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                            ),
                            Text(
                              riders[i].time,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: Color(0xff00bc89),
                                height: 2.4,
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ), Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text(
                                "Bids:",
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: Colors.red,
                                  height: 2.4,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            SizedBox(width: 15,),


                            Text(
                              riders[i].Bids,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.red,
                                height: 2.4,
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                                ]
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

List<Appointment> riders = [
  Appointment(
      name: 'Arushi Jain',
      origin: 'KR Puram, Bengaluru',
      destination: 'ITPB main road, Mahadevpura',
      image:
          'https://images.pexels.com/photos/10509825/pexels-photo-10509825.jpeg',
      time: '8:30 AM',
      Bids: '200'),
  Appointment(
      name: 'Amar gupta',
      origin: 'RR Nagar, Bengaluru',
      destination: 'Jalahalli cross, Bengaluru',
      image:
          'https://images.pexels.com/photos/3772616/pexels-photo-3772616.jpeg',
      time: '7:30 AM',
      Bids: '320'),
  Appointment(
      name: 'Sahil Mishra',
      origin: 'Challagatta, Bengaluru',
      destination: 'Old airport road, Bengaluru',
      image:
          'https://images.pexels.com/photos/1081606/pexels-photo-1081606.jpeg',
      time: '4:00 PM',
      Bids: '400'),
  Appointment(
      name: 'Arpit kumar',
      origin: 'New Tippasandra, Bengaluru',
      destination: 'Wind tunnel road, Bengaluru',
      image:
          'https://images.pexels.com/photos/3782774/pexels-photo-3782774.jpeg',
      Bids: '200',
      time: '6:00 PM'),
  Appointment(
      name: 'Sneha Iyer',
      origin: 'Marathalli, Bengaluru',
      destination: 'HSR Layout, Bengaluru',
      image:
          'https://images.pexels.com/photos/2381069/pexels-photo-2381069.jpeg?',
      time: '9:00 PM',
      Bids: '175')
];
