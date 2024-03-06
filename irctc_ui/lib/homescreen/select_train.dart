// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:irctc_ui/homescreen/components/select_train_filters.dart';
import 'package:irctc_ui/homescreen/components/select_train_proceed_to_book.dart';
import 'package:irctc_ui/homescreen/components/station_name_text.dart';
import 'package:irctc_ui/homescreen/components/train_details_card.dart';
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
                  height: setHeight(60),
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
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(height: setHeight(10)),
                      TrainDetailsCardWidget(),
                      TrainDetailsCardWidget(),
                      TrainDetailsCardWidget(),
                      TrainDetailsCardWidget(),
                      TrainDetailsCardWidget(),
                      TrainDetailsCardWidget(),
                      TrainDetailsCardWidget(),
                      SizedBox(height: setHeight(16)),
                    ],
                  ),
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: setHeight(45),
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    //   Color(0xFF1D1F24)
                    Color.fromARGB(203, 0, 0, 0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.1, 0, 0.999],
                ),
              ),
            ),
          ),
        ],
      ),

      //   bottomNavigationBar: SelectTrainScreen.selectedClassType != null
      //       ? ProceedToBookButtonWidget()
      //       : SizedBox(),
      bottomNavigationBar: ProceedToBookButtonWidget(),
    );
  }

}
