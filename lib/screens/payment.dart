import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rideshare/screens/mainClass.dart';
import 'package:rideshare/widgets/colorConstants.dart';

class creditCard extends StatefulWidget {
  const creditCard({Key? key}) : super(key: key);

  static const String page_id = "Credit Card";

  @override
  _creditCardState createState() => _creditCardState();
}

class _creditCardState extends State<creditCard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ConstantColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: ConstantColors.detailsBackground,
        body: SafeArea(
          child: ListView(
        children:[
          SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 60,width: width,
                      color: ConstantColors.detailsBackground,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image(
                                  image:
                                  Image.asset('assets/icons/backIcon.png').image,
                                  height: 18.0,
                                  width: 18.0,
                                ),
                              ),
                              const SizedBox(width: 50),
                              const Text(
                                'Payment',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  color: ConstantColors.loading,
                                  fontWeight: FontWeight.w500,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),

                              Padding(padding: EdgeInsets.only(left: width *0.40),
                                child: Image(
                                  image:
                                  Image.asset('assets/icons/notification.png').image,
                                  height: 18.0,
                                  width: 18.0,
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height:50),
                  const Divider(thickness: 2,),
                  const SizedBox(height:20),
                  Padding(padding: const EdgeInsets.only(left:20,
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Saved Cards',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: ConstantColors.loading,
                            fontWeight: FontWeight.w500,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                          softWrap: false,
                        ),

                        Padding(padding: EdgeInsets.only(left:width*0.35),
                          child: Image(
                            image:
                            Image.asset('assets/icons/addIcon.png').image,
                            height: 18.0,
                            width: 18.0,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(onTap: (){},
                          child: const Text(
                            'Add Card',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w500,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.left,
                            softWrap: false,
                          ),
                        )


                      ],
                    ),
                  ),
                  const SizedBox(height: 20),


                  Padding(padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 160,
                            width: 280,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(color: Colors.purple,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Mandiri Platinum',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'medium'),
                                    ),
                                    Image.asset(
                                      'assets/icons/visa.jpg',
                                      height: 40,
                                      width: 40,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'Balance',
                                  style: TextStyle(color: Colors.white54),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      '\$ 6,800.86',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontFamily: 'medium'),
                                    ),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 160,
                            width: 280,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Mandiri Platinum',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: 'medium'),
                                    ),
                                    Image.asset(
                                      'assets/icons/visa.jpg',
                                      height: 40,
                                      width: 40,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Balance',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      '\$ 6,800.86',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 22,
                                          fontFamily: 'medium'),
                                    ),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  Container(color: Colors.white,width: width,height: height/2,
                  child: Padding(padding: const EdgeInsets.only(left: 20,right: 20
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Other Ways To Pay',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                          softWrap: false,
                        ),
                        const SizedBox(height: 30,),
                        Container(padding: const EdgeInsets.all(10),
                          width: width,height: 50,
                          decoration: const BoxDecoration(
                            color: ConstantColors.detailsBackground
                          ),
                          child: Image(
                            image:
                            Image.asset('assets/icons/gpay.jpg').image,
                            height: 18.0,
                            width: 18.0,
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(padding: const EdgeInsets.all(10),
                          width: width,height: 50,
                          decoration: const BoxDecoration(
                              color: ConstantColors.detailsBackground
                          ),
                          child: Image(
                            image:
                            Image.asset('assets/icons/phonepe.png').image,
                            height: 18.0,
                            width: 18.0,
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(padding: const EdgeInsets.all(10),
                          width: width,height: 50,
                          decoration: const BoxDecoration(
                              color: ConstantColors.detailsBackground
                          ),
                          child: Image(
                            image:
                            Image.asset('assets/icons/paypal.png').image,
                            height: 18.0,
                            width: 18.0,
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40,left:width/4),
                          child: const Text(
                            'Total Amount',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(width: width,
                          child: ElevatedButton(onPressed: (){                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
                          }, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(ConstantColors.loading),),
                            child:const Text(
                            'Continue',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ), ),
                        )

                      ],
                    ),
                  ),
                  )

                ],
              ),

          ),
        ]
          )
        )


    );
  }
}





