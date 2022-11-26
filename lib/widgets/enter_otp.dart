import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rideshare/screens/mainClass.dart';
class Enter extends StatefulWidget {
  const Enter({Key? key}) : super(key: key);

  @override
  State<Enter> createState() => _EnterState();
}

class _EnterState extends State<Enter> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    bool hasError = false;
    String currentText = "";
    final formKey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Image(
                        image: Image.asset('assets/back.png').image,
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: Image.asset('assets/maploc.png').image,
                  height: height/3,
                  width: width/2,
                ),
              ),
              Center(
                child: Text(
                  "To confirm the bid and start \nthe ride with your partner",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(

                      appContext: context,
                      pastedTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',

                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        activeColor: Color(0xfffffde7),
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Color(0xfffffde7),
                        inactiveFillColor: Color(0xfffffde7),
                        inactiveColor: Color(0xfffffde7),
                        selectedFillColor: Color(0xfffffde7),
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
// onTap: () {
//   print("Pressed");
// },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
//if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              SizedBox(height: 20,),
              Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff1f1d1d)),
                    onPressed: () {
                      formKey.currentState!.validate();
// conditions for validating
                      if (currentText.length != 6 || currentText != "123456") {
                        setState(() => hasError = true);
                      }
                      else if
                      ( currentText  == "123456")
                        setState(
                              () {
                            hasError = false;
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()
                            )

                            );

                          },
                        );
                    },

                    child: Container(
                      width: 71.13,
                      child: const Text(
                        "Verify",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfff6e80b),
                          fontSize: 16,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )),
            ],

          )
          ,
        ),
      ),
    );
  }
}
