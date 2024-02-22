// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:irctc_ui/authentication/verify_pin.dart';
import 'package:irctc_ui/utils.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.2, 0.8, 1],
                    ),
                  ),
                  child: Image.asset(
                    "sf/img/get_started_train.png",
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),

                // logo
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppBar().preferredSize.height + 5),
                      child: Image.asset("sf/img/irctc_w.png"),
                    )
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: setWidth(30), vertical: setHeight(16)),
              color: Color(0xFF000000),
              child: Column(
                children: [
                  Text(
                    "Next Generation eTicketing System",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: setHeight(40),
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(height: setHeight(12)),
                  Text(
                    "Now with improved user experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: setHeight(17),
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFADADAD)),
                  ),
                  SizedBox(height: setHeight(15)),

                  // login button
                  InkWell(
                    onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPinScreen()));
                    },
                    child: Container(
                      height: setHeight(57),
                      decoration: BoxDecoration(
                          color: Color(0xFF2475EE),
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: Text(
                          "Login with IRCTC account",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: setHeight(18)),
                        ),
                      ),
                    ),
                  ),

                  // bottom
                  SizedBox(height: setHeight(12)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                            fontSize: setHeight(16),
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFADADAD)),
                      ),
                      SizedBox(width: setWidth(7)),
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: setHeight(16),
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 1),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
