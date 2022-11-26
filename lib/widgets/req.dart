import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:rideshare/screens/payment.dart';




class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Duration duration = new Duration();
  Duration position = new Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    return SafeArea(
      child: Scaffold(
        
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[

                   Container(padding: EdgeInsets.all(20),alignment: Alignment.topRight,child:

                        GestureDetector(onTap: (){                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  creditCard()));
                        },
                          child: Text(
                            'Confirm Payment Method',
                            style: const TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue
                            ),
                          ),
                        ),
                    ),



                  BubbleNormal(
                    text: 'bubble normal with tail',
                    isSender: false,
                    color: Color(0xFF1B97F3),
                    tail: true,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  BubbleNormal(
                    text: 'bubble normal with tail',
                    isSender: true,
                    color: Color(0xFFE8E8EE),
                    tail: true,
                    sent: true,
                  ),
                  DateChip(
                    date: new DateTime(now.year, now.month, now.day - 2),
                  ),
                  BubbleNormal(
                    text: 'bubble normal without tail',
                    isSender: false,
                    color: Color(0xFF1B97F3),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  BubbleNormal(
                    text: 'bubble normal without tail',
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    sent: true,
                    seen: true,
                    delivered: true,
                  ),
                  BubbleSpecialOne(
                    text: 'bubble special one with tail',
                    isSender: false,
                    color: Color(0xFF1B97F3),
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  DateChip(
                    date: new DateTime(now.year, now.month, now.day - 1),
                  ),
                  BubbleSpecialOne(
                    text: 'bubble special one with tail',
                    color: Color(0xFFE8E8EE),
                    seen: true,
                  ),
                  BubbleSpecialOne(
                    text: 'bubble special one without tail',
                    isSender: false,
                    tail: false,
                    color: Color(0xFF1B97F3),
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  BubbleSpecialOne(
                    text: 'bubble special one without tail',
                    tail: false,
                    color: Color(0xFFE8E8EE),
                    sent: true,
                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    isSender: false,
                    color: Color(0xFF1B97F3),
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  DateChip(
                    date: now,
                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    isSender: true,
                    color: Color(0xFFE8E8EE),
                    sent: true,
                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow without tail',
                    isSender: false,
                    tail: false,
                    color: Color(0xFF1B97F3),
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow without tail',
                    tail: false,
                    color: Color(0xFFE8E8EE),
                    delivered: true,
                  ),
                  BubbleSpecialThree(
                    text: 'bubble special three without tail',
                    color: Color(0xFF1B97F3),
                    tail: false,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  BubbleSpecialThree(
                    text: 'bubble special three with tail',
                    color: Color(0xFF1B97F3),
                    tail: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  BubbleSpecialThree(
                    text: "bubble special three without tail",
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    isSender: false,
                  ),
                  BubbleSpecialThree(
                    text: "bubble special three with tail",
                    color: Color(0xFFE8E8EE),
                    tail: true,
                    isSender: false,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            MessageBar(
              onSend: (_) => print(_),
              actions: [
                InkWell(
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24,
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: InkWell(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }


}