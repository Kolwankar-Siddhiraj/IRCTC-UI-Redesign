// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, camel_case_types, prefer_typing_uninitialized_variables, avoid_init_to_null

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class TrainDetailsCardWidget extends StatefulWidget {
  const TrainDetailsCardWidget({super.key});

  @override
  State<TrainDetailsCardWidget> createState() => _TrainDetailsCardWidgetState();
}

class _TrainDetailsCardWidgetState extends State<TrainDetailsCardWidget> {
  static String? selectedClassType = null;

  @override
  void initState() {
    super.initState();
    _TrainDetailsCardWidgetState.selectedClassType = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(230),
      margin: EdgeInsets.symmetric(
          horizontal: setWidth(10), vertical: setHeight(10)),
      decoration: BoxDecoration(
          color: Color(0xFF1D1F24), borderRadius: BorderRadius.circular(19)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: setWidth(21), vertical: setHeight(16)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SUR Express (134556)",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: setHeight(18),
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: setHeight(40),
                  padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          Divider(
            height: 0,
            thickness: 1.6,
            color: Color(0xFF282B32),
          ),

          // station and time details
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: setWidth(21), vertical: setHeight(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stationTimeAndDateInfoWidget(
                        true, "19:20", "Solapur Jn", "Tue, 04 Feb"),
                    SizedBox(width: setWidth(5)),
                    Expanded(
                      child: SizedBox(
                        height: setHeight(70),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: DottedLine(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                lineThickness: 1.9,
                                dashLength: 7,
                                dashColor: Color(0xFF3D4149),
                                dashRadius: 0.0,
                                dashGapLength: 5,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                            ),
                            SizedBox(height: setHeight(7)),
                            Text(
                              "10 hr 38 min",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontSize: setHeight(14),
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: setWidth(5)),
                    stationTimeAndDateInfoWidget(
                        false, "05:52", "Kalyan Jn", "Wed, 05 Feb"),
                  ],
                ),
              ],
            ),
          ),

          // tickets availablity
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: setWidth(21)),
                InkWell(
                  onTap: () {
                    setSelectedClassType("SL");
                  },
                  child: ticketAvailabilityWidget(
                      classType: "SL",
                      ticketAvailability: "available",
                      availableSeat: 34),
                ),
                InkWell(
                  onTap: () {
                    setSelectedClassType("2S");
                  },
                  child: ticketAvailabilityWidget(
                      classType: "2S",
                      ticketAvailability: "waiting",
                      availableSeat: 10),
                ),
                InkWell(
                  onTap: () {
                    setSelectedClassType("3A");
                  },
                  child: ticketAvailabilityWidget(
                      classType: "3A",
                      ticketAvailability: "regret",
                      availableSeat: 0),
                ),
                InkWell(
                  onTap: () {
                    setSelectedClassType("2A");
                  },
                  child: ticketAvailabilityWidget(
                      classType: "2A",
                      ticketAvailability: "available",
                      availableSeat: 34),
                ),
                InkWell(
                  onTap: () {
                    setSelectedClassType("1A");
                  },
                  child: ticketAvailabilityWidget(
                      classType: "1A",
                      ticketAvailability: "available",
                      availableSeat: 34),
                ),
                SizedBox(width: setWidth(11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setSelectedClassType(classType) {
    setState(() {
      if (_TrainDetailsCardWidgetState.selectedClassType == null ||
          _TrainDetailsCardWidgetState.selectedClassType != classType) {
        _TrainDetailsCardWidgetState.selectedClassType = classType;
      } else {
        _TrainDetailsCardWidgetState.selectedClassType = null;
      }
    });
  }
}

Widget stationTimeAndDateInfoWidget(
    bool isStartStation, String time, String station, String date) {
  return Column(
    crossAxisAlignment:
        isStartStation ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Text(
        time,
        style: TextStyle(
            color: Colors.white,
            fontSize: setHeight(16),
            fontWeight: FontWeight.bold,
            letterSpacing: 0),
      ),
      Text(
        station,
        style: TextStyle(
            color: Color(0xFF8F8F8F),
            fontSize: setHeight(14),
            fontWeight: FontWeight.w400,
            letterSpacing: 0),
      ),
      Text(
        date,
        style: TextStyle(
            color: Color(0xFF8F8F8F),
            fontSize: setHeight(14),
            fontWeight: FontWeight.w400,
            letterSpacing: 0),
      ),
    ],
  );
}

class ticketAvailabilityWidget extends StatefulWidget {
  const ticketAvailabilityWidget(
      {super.key,
      required this.ticketAvailability,
      required this.classType,
      required this.availableSeat});

  final ticketAvailability;
  final classType;
  final availableSeat;

  @override
  State<ticketAvailabilityWidget> createState() =>
      _ticketAvailabilityWidgetState();
}

class _ticketAvailabilityWidgetState extends State<ticketAvailabilityWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: setHeight(55),
          width: setWidth(104),
          padding: EdgeInsets.symmetric(
              horizontal: setWidth(10), vertical: setHeight(5)),
          decoration: BoxDecoration(
            color: Color(0xFF282B32),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 1.6,
                color: _TrainDetailsCardWidgetState.selectedClassType ==
                        widget.classType
                    ? Color(0xFF2475EE)
                    : Color(0xFF282B32)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.classType,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: setWidth(7), vertical: setHeight(4)),
                    decoration: BoxDecoration(
                        color: widget.ticketAvailability == "available"
                            ? Color(0xFF24903C).withOpacity(0.7)
                            : widget.ticketAvailability == "waiting"
                                ? Color(0xFFE7A428).withOpacity(0.7)
                                : Color(0xFFD84F4F).withOpacity(0.7),
                        // : Color(0xFFD84F4F),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      widget.ticketAvailability == "available"
                          ? "Available"
                          : widget.ticketAvailability == "waiting"
                              ? "Waiting"
                              : "Regret",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: setHeight(11)),
                    ),
                  )
                ],
              ),
              SizedBox(height: setHeight(4)),
              Text(
                "${widget.availableSeat} Seats",
                style: TextStyle(
                    color: Color(0xFF8F8F8F), fontSize: setHeight(12)),
              ),
            ],
          ),
        ),
        SizedBox(width: setWidth(10)),
      ],
    );
  }
}
