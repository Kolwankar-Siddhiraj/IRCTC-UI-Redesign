// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:irctc_ui/homescreen/components/select_train_filters.dart';
import 'package:irctc_ui/homescreen/components/station_name_text.dart';
import 'package:irctc_ui/homescreen/search_train.dart';
import 'package:irctc_ui/utils.dart';
import 'package:dotted_line/dotted_line.dart';

class SelectTrainScreen extends StatefulWidget {
  const SelectTrainScreen({super.key});

  @override
  State<SelectTrainScreen> createState() => _SelectTrainScreenState();
}

class _SelectTrainScreenState extends State<SelectTrainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1F24),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchTrainScreen()));
              },
              child: SizedBox(
                width: setWidth(45),
                height: setHeight(45),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Text(
              "Select train",
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

          // body content
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  height: setHeight(70),
                  color: Color(0xFF1D1F24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StationNameTextWidget(
                          stationCode: "KYN",
                          stationName: "Kalyan Jn",
                          isSourceStation: true),
                      Flexible(
                        child: DottedLine(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          lineThickness: 1.9,
                          dashLength: 10,
                          dashColor: Color(0xFF3A3F49),
                          dashRadius: 0.0,
                          dashGapLength: 5,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                      StationNameTextWidget(
                          stationCode: "DR",
                          stationName: "Dadar Jn",
                          isSourceStation: false),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFF1D1F24),
                  height: setHeight(70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: setHeight(34),
                        width: setWidth(34),
                        decoration: BoxDecoration(
                            color: Color(0xFF282B32),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.arrow_back_ios_rounded,
                            color: Color(0xFF6D6E7C)),
                      ),
                      // date container
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: setWidth(16)),
                        child: Text(
                          "Tue, 07 Jan",
                          style: TextStyle(
                              fontSize: setHeight(18),
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        height: setHeight(34),
                        width: setWidth(34),
                        decoration: BoxDecoration(
                            color: Color(0xFF282B32),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            color: Color(0xFF6D6E7C)),
                      ),
                    ],
                  ),
                ),

                // filter container
                Container(
                  height: setHeight(60),
                  color: Color(0xFF282B32),
                  padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
                  child: SelectTrainFiltersWidget(),
                ),

                // train list here
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: setHeight(100),
                          color: Colors.amber,
                        ),
                        Container(
                          height: setHeight(100),
                          color: Colors.pink,
                        ),
                        Container(
                          height: setHeight(100),
                          color: Colors.blue,
                        ),
                        Container(
                          height: setHeight(100),
                          color: Colors.red,
                        ),
                        Container(
                          height: setHeight(100),
                          color: Colors.green,
                        ),
                        Container(
                          height: setHeight(100),
                          color: Colors.orange,
                        ),
                        Container(
                          height: setHeight(100),
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                  stops: [0, 0.2, 0.9, 1],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: setHeight(110),
        color: Color(0xFF1D1F24),
        padding: EdgeInsets.only(
            right: setWidth(30), bottom: setHeight(14), left: setWidth(30)),
        child: Column(
          children: [
            SizedBox(height: setHeight(16)),
            Row(
              children: [
                Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "SUR Express (134556), 3AC",
                          style: TextStyle(
                              color: Color(0xFF8F8F8F),
                              fontWeight: FontWeight.bold,
                              fontSize: setHeight(13),
                              letterSpacing: 0),
                        ),
                        SizedBox(height: setHeight(10)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.currency_rupee_rounded,
                              color: Color(0xFF8F8F8F),
                              size: setHeight(23),
                            ),
                            Text(
                              "1999.00",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  //   color: Color(0xFF2475EE),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: setHeight(23)),
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      height: setHeight(60),
                      decoration: BoxDecoration(
                          color: Color(0xFF2475EE),
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: Text(
                          "Proceed to Book",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: setHeight(18),
                              letterSpacing: 0),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
