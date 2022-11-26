import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rideshare/DataHandler/appData.dart';
import 'package:rideshare/provider/auth.dart';
import 'package:rideshare/provider/user_details_provider.dart';
import 'package:rideshare/screens/login.dart';

import 'screens/sign.dart';
import 'screens/maps.dart';
import 'screens/splashscreen.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';


void main() async{
  final ipv4 = await Ipify.ipv4();
  print(ipv4);
  Provider.debugCheckInvalidValueType = null;

  //    "ip_address":"192.168.145.175",

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return

      FutureBuilder(
        // Initialize FlutterFire

        future: Firebase.initializeApp(),
    builder: (context, snapshot) {
    // Check for errors


    // Once complete, show your application
    return MultiProvider(
        providers: [
        Provider(create:  (context) => AppData(),),
          Provider(create:  (context) => UserProvider(),),




        ],
         child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: Splash2()),
    ),


    );
    }

    // Otherwise, show something whilst waiting for initialization to compl

    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor:const Color(0xff252525),
        body: Container(padding: EdgeInsets.only(left: 30,right: 30,top: 100,bottom: height/8),
          height: height,width: width,


          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black
          ),        borderRadius: BorderRadius.circular(20),
                          color: const Color(0x1ed5d5d5),

          ),


            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),

                Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Image(
                        width: width/2,
                        image: const AssetImage("assets/rideshare_logo.png"))),
                SizedBox(height: height/8,),

                Container(

                    width: width*0.60,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const        Color(0xffff9040),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login()
                        )

                        );


                      },

                      child: Container(


                        width: 71.13,
                        child: const Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 30,),

                Container(
                    width: width*0.60,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const   Color(0xffd9d9d9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Signin()
                        )

                        );


                      },

                      child: Container(alignment: Alignment.center,
                          width: 71.13,
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              color: Color(0xffff9040),
                              fontSize: 20,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

