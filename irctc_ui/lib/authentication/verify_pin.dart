// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irctc_ui/homescreen/homepage.dart';
import 'package:irctc_ui/utils.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'dart:ui';

class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  bool isLoaderActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF010101),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ImageFiltered(
              imageFilter: isLoaderActive
                  ? ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0)
                  : ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Text("Help",
                  style: TextStyle(
                      fontSize: setHeight(18),
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2475EE))),
            )
          ],
        ),
      ),

      // body
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            color: Color(0xFF010101),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: setHeight(AppBar().preferredSize.height) * 2),
                Image.asset("sf/img/logo_n.png",
                    height: setHeight(130), width: setWidth(100)),

                SizedBox(height: setHeight(16)),
                Text(
                  "Enter your PIN",
                  style: TextStyle(
                    letterSpacing: 0,
                    color: Colors.white,
                    fontSize: setHeight(32),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: setHeight(5)),
                Text(
                  "4 digit login pin for @user_id",
                  style: TextStyle(
                    color: Color.fromARGB(150, 255, 255, 255),
                    fontSize: setHeight(13),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // pin input
                SizedBox(height: setHeight(50)),
                SizedBox(
                  width: setWidth(140),
                  child: PinInputTextField(
                    pinLength: 4,
                    autoFocus: true,
                    decoration: UnderlineDecoration(
                      textStyle: TextStyle(fontSize: setHeight(37)),
                      lineStrokeCap: StrokeCap.round,
                      colorBuilder: PinListenColorBuilder(
                          Colors.green, Color(0xFF363636)),
                      lineHeight: 5,
                      gapSpace: 12,
                      obscureStyle: ObscureStyle(
                        isTextObscure: true,
                        obscureText: '*',
                      ),
                    ),
                    textInputAction: TextInputAction.go,
                    enabled: true,
                    keyboardType: TextInputType.number,
                    onChanged: (pin) {
                      debugPrint('onChanged execute. pin:$pin');
                      if (pin.length == 4) {
                        setState(() {
                          isLoaderActive = true;
                          print("isLoaderActive :: $isLoaderActive");
                        });

                        Timer(
                            Duration(milliseconds: 3000),
                            () => setState(() {
                                  isLoaderActive = false;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                }));
                      }
                    },
                  ),
                ),

                // forgot pin
                SizedBox(height: setHeight(100)),
                Container(
                  width: setWidth(100),
                  height: setHeight(39),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 24, 49),
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: Text(
                      "Forgot PIN?",
                      style: TextStyle(
                          color: Color(0xFF2475EE),
                          fontSize: setHeight(14),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                // switch user
                SizedBox(height: setHeight(14)),
                Text(
                  "Switch user or register?",
                  style: TextStyle(
                    color: Color(0xFFC2C2C2),
                    fontSize: setHeight(13),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // blur effect
          isLoaderActive
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: CupertinoActivityIndicator(
                        radius: 25.0, color: CupertinoColors.white),
                  ),
                )
              : Container(
                  color: Colors.transparent,
                )
        ],
      ),
    );
  }
}
