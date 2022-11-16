import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
    return MaterialApp(
      home: Scaffold(body: MyApp()),
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
        backgroundColor: Color.fromRGBO(37, 3, 37, 1),
        body: Container(padding: EdgeInsets.only(left: 30,right: 30,top: 100,bottom: height/8),
          height: height,width: width,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(25),

          ),
          child: Card(

            elevation: 1,
            color: Color(0xffafafaf),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10,),

              Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Image(
                      width: width/2,
                      image: AssetImage("assets/rideshare_logo.png"))),
              Container(
                  width: width*0.60,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const          Color(0xff3b35ef),
                  ),
                    onPressed: () {


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
              Container(
                  width: width*0.60,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const   Color(0xffd9d9d9),

                    ),
                    onPressed: () {


                    },

                    child: Container(
                      width: 71.13,
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xff6e6bd0),
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
