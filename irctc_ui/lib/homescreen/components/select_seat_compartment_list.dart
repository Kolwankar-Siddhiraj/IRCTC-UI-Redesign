// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_init_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class TrainCompartmentListWidget extends StatefulWidget {
  const TrainCompartmentListWidget({super.key});

  @override
  State<TrainCompartmentListWidget> createState() =>
      _TrainCompartmentListWidgetState();
}

class _TrainCompartmentListWidgetState
    extends State<TrainCompartmentListWidget> {
  bool isSelectedCompartmentActive = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: setWidth(37),
            //   vertical: setHeight(18)
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: detectScroll,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: setHeight(167)),
                  compartmentCard("01"),
                  compartmentCard("02"),
                  compartmentCard("03"),
                  compartmentCard("04"),
                  compartmentCard("05"),
                  compartmentCard("06"),
                  compartmentCard("07"),
                  compartmentCard("08"),
                  compartmentCard("09"),
                  compartmentCard("10"),
                  SizedBox(height: setHeight(151))
                ],
              ),
            ),
          ),
        ),

        // gradient color top
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: setHeight(70),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.9, 0, 0],
              ),
            ),
          ),
        ),

        // gradient color bottom
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: setHeight(70),
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
                stops: [0, 0, 0.1, 1],
              ),
            ),
          ),
        ),

        // selected compartment border
        isSelectedCompartmentActive
            ? Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      print("pressed");
                      isSelectedCompartmentActive = false;
                    });
                    //   Timer(
                    //       Duration(milliseconds: 1000),
                    //       () => setState(() {
                    //             isSelectedCompartmentActive = true;
                    //           }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: setWidth(20)),
                    height: setHeight(280),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 3, color: Color(0xFF2475EE))),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  bool detectScroll(scrollNotification) {
    if (scrollNotification is ScrollStartNotification) {
      setState(() {
        print("scroll start");
        isSelectedCompartmentActive = false;
      });
    } else if (scrollNotification is ScrollUpdateNotification) {
      setState(() {
        print("scroll update");
        isSelectedCompartmentActive = false;
      });
    } else if (scrollNotification is ScrollEndNotification) {
      print("scroll end");
      setState(() {
        isSelectedCompartmentActive = true;
      });
    }

    return false;
  }
}

Widget compartmentCard(String compartmentNo) {
  return Column(
    children: [
      Container(
        height: setHeight(210),
        decoration: BoxDecoration(
            color: Color(0xFF1D1F24), borderRadius: BorderRadius.circular(9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Compartment",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: setHeight(12),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0),
              ),
            ),
            SizedBox(height: setHeight(3)),
            Center(
              child: Text(
                compartmentNo,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: setHeight(18),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: setHeight(16)),
    ],
  );
}
