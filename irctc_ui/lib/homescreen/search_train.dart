// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:irctc_ui/homescreen/components/train_search_filter.dart';
import 'package:irctc_ui/homescreen/homepage.dart';
import 'package:irctc_ui/homescreen/select_train.dart';
import 'package:irctc_ui/utils.dart';
import 'package:marquee/marquee.dart';
import 'package:dotted_line/dotted_line.dart';

class SearchTrainScreen extends StatefulWidget {
  const SearchTrainScreen({super.key});

  @override
  State<SearchTrainScreen> createState() => _SearchTrainScreenState();
}

class _SearchTrainScreenState extends State<SearchTrainScreen> {
  List<String> classType = <String>[
    "All classes",
    "General",
    "Sleeper",
    "1st AC",
    "2nd AC",
    "3rd AC",
    "2nd Sitting",
    "Chair Car AC",
    "Handicapped"
  ];
  String selectedClassType = "All classes";

  List<String> quotaType = <String>[
    "General",
    "Ladies",
    "Defence",
  ];
  String selectedQuotaType = "General";
  bool isRoundTripChecked = false;
  int activeFilter = 1;

  late DateTime departureDate;
  late DateTime returnDate;

  bool isDepartureDateChanged = false;
  bool isReturnDateChanged = false;

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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
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
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: setWidth(30), vertical: setHeight(18)),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Color(0xFF1D1F24),
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // source
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: setWidth(30), vertical: setHeight(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: setHeight(12)),
                              Text(
                                "From",
                                style: TextStyle(
                                    color: Color(0xFF676767),
                                    fontSize: setHeight(16),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: setHeight(9)),
                              Container(
                                height: setHeight(60),
                                padding: EdgeInsets.symmetric(
                                    horizontal: setWidth(18)),
                                decoration: BoxDecoration(
                                    color: Color(0xFF282B32),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Row(
                                  children: [
                                    Text(
                                      "KYN",
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
                                        "Kalyan Jn",
                                        style: TextStyle(
                                          color: Color(0xFF8F8F8F),
                                          fontSize: setHeight(16),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: setHeight(10)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: setWidth(25),
                                height: setHeight(50),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    ))),
                            SizedBox(width: setWidth(7)),
                            Flexible(
                              child: DottedLine(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                lineThickness: 2.3,
                                dashLength: 10,
                                dashColor: Color(0xFF3A3F49),
                                dashRadius: 0.0,
                                dashGapLength: 5,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                            ),
                            Container(
                              width: setWidth(45),
                              height: setHeight(45),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF2475EE)),
                              child: Icon(Icons.swap_vert_rounded,
                                  size: setHeight(32), color: Colors.white),
                            ),
                            Flexible(
                              child: DottedLine(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                lineThickness: 2.3,
                                dashLength: 10,
                                dashColor: Color(0xFF3A3F49),
                                dashRadius: 0.0,
                                dashGapLength: 5,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                            ),
                            SizedBox(width: setWidth(7)),
                            Container(
                                width: setWidth(25),
                                height: setHeight(50),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(100),
                                      bottomLeft: Radius.circular(100),
                                    ))),
                          ],
                        ),

                        // destination
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: setWidth(30), vertical: setHeight(7)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To",
                                style: TextStyle(
                                    color: Color(0xFF676767),
                                    fontSize: setHeight(16),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: setHeight(9)),
                              Container(
                                height: setHeight(60),
                                padding: EdgeInsets.symmetric(
                                    horizontal: setWidth(18)),
                                decoration: BoxDecoration(
                                    color: Color(0xFF282B32),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Row(
                                  children: [
                                    Text(
                                      "DR",
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
                                        "Dadar",
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

                              // class type input
                              SizedBox(height: setHeight(19)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Class",
                                    style: TextStyle(
                                        color: Color(0xFF676767),
                                        fontSize: setHeight(16),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: setHeight(10)),
                                  Container(
                                    height: setHeight(50),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF282B32),
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    child: Center(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Color(0xFF8F8F8F),
                                          // dropdownColor: Color(0xFF282B32),
                                          padding: EdgeInsets.only(right: 10),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          isExpanded: true,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: setHeight(18),
                                              fontWeight: FontWeight.w500),
                                          hint: Text(
                                            selectedClassType,
                                            textAlign: TextAlign.left,
                                            style: classType
                                                    .contains(selectedClassType)
                                                ? TextStyle(color: Colors.white)
                                                : TextStyle(
                                                    fontSize: setHeight(18),
                                                    color: Color(0xFF8F8F8F)),
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedClassType =
                                                  newValue.toString();

                                              print(
                                                  "selectedClassType :: $selectedClassType");
                                            });
                                          },
                                          items: classType.map((ct) {
                                            return DropdownMenuItem(
                                              value: ct.toString(),
                                              child: Text(
                                                ct.toString(),
                                                style: TextStyle(),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: setHeight(10)),
                                ],
                              ),

                              // quota input
                              SizedBox(height: setHeight(5)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Quota",
                                    style: TextStyle(
                                        color: Color(0xFF676767),
                                        fontSize: setHeight(16),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: setHeight(10)),
                                  Container(
                                    height: setHeight(50),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF282B32),
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    child: Center(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Color(0xFF8F8F8F),
                                          // dropdownColor: Color(0xFF282B32),
                                          padding: EdgeInsets.only(right: 10),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          isExpanded: true,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: setHeight(18),
                                              fontWeight: FontWeight.w500),
                                          hint: Text(
                                            selectedQuotaType,
                                            textAlign: TextAlign.left,
                                            style: quotaType
                                                    .contains(selectedQuotaType)
                                                ? TextStyle(color: Colors.white)
                                                : TextStyle(
                                                    fontSize: setHeight(18),
                                                    color: Color(0xFF8F8F8F)),
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedQuotaType =
                                                  newValue.toString();

                                              print(
                                                  "selectedQuotaType :: $selectedQuotaType");
                                            });
                                          },
                                          items: quotaType.map((ct) {
                                            return DropdownMenuItem(
                                              value: ct.toString(),
                                              child: Text(
                                                ct.toString(),
                                                style: TextStyle(),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: setHeight(5)),
                                ],
                              ),

                              // round trip checkbox
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      value: isRoundTripChecked,
                                      activeColor: Color(0xFF2475EE),
                                      side: BorderSide(
                                          color: Color(0xFF2475EE), width: 2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isRoundTripChecked = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: setWidth(5)),
                                  Text(
                                    "Round trip",
                                    style: TextStyle(
                                        color: Color(0xFF676767),
                                        fontSize: setHeight(18),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),

                              // date
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Departure date",
                                          style: TextStyle(
                                              color: Color(0xFF676767),
                                              fontSize: setHeight(16),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: setHeight(7)),
                                        InkWell(
                                          onTap: () {
                                            getDate(context, "departure");
                                          },
                                          child: Container(
                                            height: setHeight(50),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: setWidth(14)),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF282B32),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month_rounded,
                                                  color: Color(0xFF676767),
                                                ),
                                                SizedBox(width: setWidth(5)),
                                                Text(
                                                  isDepartureDateChanged
                                                      ? "${departureDate.day}-${departureDate.month}-${departureDate.year}"
                                                      : "Choose date",
                                                  style: TextStyle(
                                                      color:
                                                          isDepartureDateChanged
                                                              ? Colors.white
                                                              : Color(
                                                                  0xFF676767),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: setHeight(16)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: setWidth(16)),
                                  isRoundTripChecked
                                      ? Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Return date",
                                                style: TextStyle(
                                                    color: Color(0xFF676767),
                                                    fontSize: setHeight(16),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(height: setHeight(7)),
                                              InkWell(
                                                onTap: () {
                                                  getDate(context, "return");
                                                },
                                                child: Container(
                                                  height: setHeight(50),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: setWidth(14)),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF282B32),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14)),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .calendar_month_rounded,
                                                        color:
                                                            Color(0xFF676767),
                                                      ),
                                                      SizedBox(
                                                          width: setWidth(5)),
                                                      Text(
                                                        isReturnDateChanged
                                                            ? "${returnDate.day}-${returnDate.month}-${returnDate.year}"
                                                            : "Choose date",
                                                        style: TextStyle(
                                                            color: isReturnDateChanged
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF676767),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                setHeight(16)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Expanded(flex: 1, child: Container())
                                ],
                              ),

                              // filters
                              SizedBox(height: setHeight(16)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                        color: Color(0xFF676767),
                                        fontSize: setHeight(16),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: setHeight(10)),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SearchTrainFilterCardWidget(
                                          title: "Flexible with date",
                                        ),
                                        SizedBox(width: setWidth(10)),
                                        SearchTrainFilterCardWidget(
                                          title: "Disability concession",
                                        ),
                                        SizedBox(width: setWidth(10)),
                                        SearchTrainFilterCardWidget(
                                          title: "Superfast",
                                        ),
                                        SizedBox(width: setWidth(10)),
                                        SearchTrainFilterCardWidget(
                                          title: "Return available",
                                        ),
                                        SizedBox(width: setWidth(10)),
                                        SearchTrainFilterCardWidget(
                                          title: "Example",
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              // search trains button
                              SizedBox(height: setHeight(16)),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectTrainScreen()));
                                },
                                child: Container(
                                  height: setHeight(60),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF2475EE),
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: Text(
                                      "Search Trains",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: setHeight(21),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: setHeight(30))
              ],
            ),
          ),
        ],
      ),
    );
  }

  // date picker
  Future<void> getDate(BuildContext context, String dateFor) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1));

    setState(() {
      if (dateFor == "departure") {
        departureDate = picked!;
        isDepartureDateChanged = true;
      } else if (dateFor == "return") {
        returnDate = picked!;
        isReturnDateChanged = true;
      }
    });
  }
}
