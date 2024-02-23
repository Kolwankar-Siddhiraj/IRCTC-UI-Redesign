// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';
import 'package:marquee/marquee.dart';

class SearchTrainScreen extends StatefulWidget {
  const SearchTrainScreen({super.key});

  @override
  State<SearchTrainScreen> createState() => _SearchTrainScreenState();
}

class _SearchTrainScreenState extends State<SearchTrainScreen> {
  List<String> railwayStaions = <String>[
    "Kalyan",
    "Dombivli",
    "Thane",
    "Mulund",
    "Bhandup",
    "Ghatkopar",
    "Vikroli",
    "Kurla",
    "Dadar",
    "Parel",
    "Byculla",
    "CSMT",
    "Churchgate",
    "Marine lines",
    "Churni road",
    "Mumbai Central",
    "Bandra",
    "Andheri",
    "Goregaon",
    "Malad",
    "Kandivali",
    "Borivali",
    "Bhayandar",
    "Vasai Road",
    "Virar",
    "Airoli",
    "Rabale",
    "Ghansoli",
    "Turbhe",
    "Nerul",
    "Seawoords Darave",
    "Panvel"
  ];
  List<String> tempRailwayStations = [];
  String selectedSourceStation = "Source";
  String selectedDestinationStation = "Destination";

  bool isSearchRailwayStationActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1F24),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: setWidth(45),
              height: setHeight(45),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              "Search train",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: setHeight(21)),
            ),
            SizedBox(
              width: setWidth(45),
              height: setHeight(45),
            ),
          ],
        ),
      ),

      // body
      body: Stack(
        children: [
          Container(
            color: Color(0xFF010101),
            child: Image.asset("sf/img/home_bg.png",
                fit: BoxFit.cover, width: double.maxFinite),
          ),

          // main body
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  height: setHeight(39),
                  color: Color(0xFFF1A868),
                  child: Marquee(
                    text: "This is the place holder for importance notice.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    blankSpace: 30.0,
                    velocity: 100.0,
                    pauseAfterRound: Duration(seconds: 2),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),

                // search train card
                SizedBox(height: setHeight(16)),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: setWidth(18)),
                    padding: EdgeInsets.symmetric(
                        horizontal: setWidth(30), vertical: setHeight(18)),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Color(0xFF1D1F24),
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // source
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  color: Color(0xFF676767),
                                  fontSize: setHeight(16),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: setHeight(9)),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSearchRailwayStationActive = true;
                                });
                              },
                              child: Container(
                                height: setHeight(60),
                                padding: EdgeInsets.symmetric(
                                    horizontal: setWidth(18)),
                                decoration: BoxDecoration(
                                    color: Color(0xFF282B32),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Row(
                                  children: [
                                    Text(
                                      selectedSourceStation == "Source"
                                          ? ""
                                          : "KYN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: setHeight(27),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: setWidth(10)),
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        selectedSourceStation,
                                        style: TextStyle(
                                          color: Color(0xFF8F8F8F),
                                          fontSize: setHeight(16),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: setHeight(34))
              ],
            ),
          ),

          // railway station input box
          isSearchRailwayStationActive
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: setWidth(370),
                    height: setHeight(500),
                    padding: EdgeInsets.symmetric(
                        horizontal: setWidth(21), vertical: setHeight(21)),
                    decoration: BoxDecoration(
                        color: Color(0xFF282B32),
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: setWidth(10)),
                          decoration: BoxDecoration(
                              color: Color(0xFF191A1D),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1.6, color: Color(0xFF2475EE))),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            cursorColor: Colors.white,
                            style: TextStyle(
                                fontSize: setHeight(16),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search railway staion",
                              hintStyle: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontSize: setHeight(16),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            ),
                            onChanged: (val) {
                              filterStation(val);
                            },
                          ),
                        ),
                        SizedBox(height: setHeight(7)),
                        Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: tempRailwayStations.map((rs) {
                                  return InkWell(
                                    onTap: () {
                                      selectedSourceStation = rs.toUpperCase();
                                    },
                                    child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2.5),
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                          // rs.toUpperCase(),
                                          rs,
                                          style:
                                              TextStyle(fontFamily: "Poppins"),
                                        ))),
                                  );
                                }).toList(),
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  color: Colors.transparent,
                ),

        //   isSearchRailwayStationActive
        //       ? BackdropFilter(
        //           filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        //           child: Container(
        //             width: double.maxFinite,
        //             height: double.maxFinite,
        //             decoration: BoxDecoration(color: Colors.transparent),
        //           ),
        //         )
        //       : Container(
        //           color: Colors.transparent,
        //         )
        ],
      ),
    );
  }

  // filter railway stations
  void filterStation(keyword) {
    setState(() {
      tempRailwayStations = railwayStaions
          .where((element) =>
              element.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }
}
