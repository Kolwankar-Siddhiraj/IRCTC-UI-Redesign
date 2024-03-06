// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_init_to_null

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:irctc_ui/homescreen/components/select_seat_compartment_list.dart';
import 'package:irctc_ui/homescreen/components/select_seat_row_info.dart';
import 'package:irctc_ui/homescreen/components/select_train_proceed_to_book.dart';
import 'package:irctc_ui/homescreen/components/station_name_text.dart';
import 'package:irctc_ui/homescreen/components/train_compartment_details.dart';
import 'package:irctc_ui/homescreen/select_train.dart';
import 'package:irctc_ui/utils.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
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
                        builder: (context) => SelectTrainScreen()));
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
              "Select seat",
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
                // train name
                Container(
                  height: setHeight(55),
                  color: Color(0xFF1D1F24),
                  padding: EdgeInsets.symmetric(horizontal: setWidth(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SUR Express (134556)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: setHeight(19),
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: setHeight(40),
                        padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFF282B32)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.route_rounded, color: Colors.white),
                            SizedBox(width: setWidth(5)),
                            Text(
                              "View route",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontSize: setHeight(14),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // station names
                Container(
                  height: setHeight(64),
                  color: Color(0xFF1D1F24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StationNameTextWidget(
                          stationCode: "KYN",
                          stationName: "Kalyan Jn",
                          isSourceStation: true),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tue, 07 Feb",
                              style: TextStyle(
                                  fontSize: setHeight(11),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0),
                            ),
                            SizedBox(height: setHeight(7)),
                            DottedLine(
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
                            SizedBox(height: setHeight(5)),
                            Text(
                              "10 hr 38 min",
                              style: TextStyle(
                                  fontSize: setHeight(11),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0),
                            ),
                          ],
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
                  height: setHeight(60),
                  padding: EdgeInsets.symmetric(
                      horizontal: setWidth(30), vertical: setHeight(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "General",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: setHeight(18),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0),
                      ),
                      SizedBox(width: setWidth(5)),
                      VerticalDivider(
                        thickness: 1.6,
                        color: Color(0xFF3D4149),
                      ),
                      SizedBox(width: setWidth(5)),
                      Text(
                        "1A",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: setHeight(18),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                // filter container
                Container(
                  height: setHeight(50),
                  color: Color(0xFF282B32),
                  padding: EdgeInsets.symmetric(horizontal: setWidth(30)),
                  child: SeatStatusInfoWidget(),
                ),

                // main body
                Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: TrainCompartmentListWidget()),
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            SizedBox(
                              height: setHeight(21),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: setWidth(16),
                                    color: Color(0xFF1A1A1A),
                                  ),
                                  Container(
                                    width: setWidth(16),
                                    color: Color(0xFF1A1A1A),
                                  )
                                ],
                              ),
                            ),
                            // train compartment details
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: setWidth(16), left: setWidth(10)),
                                    padding: EdgeInsets.symmetric(horizontal: setWidth(19), vertical: setHeight(7)),
                                decoration: BoxDecoration(
                                    color: Color(0xFF1D1F24),
                                    borderRadius: BorderRadius.circular(25)),
                                    child: TrainCompartmentDetailsWidget(),
                              ),
                            ),
                            SizedBox(
                              height: setHeight(21),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: setWidth(16),
                                    color: Color(0xFF1A1A1A),
                                  ),
                                  Container(
                                    width: setWidth(16),
                                    color: Color(0xFF1A1A1A),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: ProceedToBookButtonWidget(),
    );
  }
}
