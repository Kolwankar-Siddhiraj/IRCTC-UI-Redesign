// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_init_to_null, camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

int seatNumber = 0;

class TrainCompartmentDetailsWidget extends StatefulWidget {
  const TrainCompartmentDetailsWidget({super.key});

  @override
  State<TrainCompartmentDetailsWidget> createState() =>
      _TrainCompartmentDetailsWidgetState();
}

class _TrainCompartmentDetailsWidgetState
    extends State<TrainCompartmentDetailsWidget> {
  @override
  void initState() {
    super.initState();
    seatNumber = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            "Compartment 01",
            style: TextStyle(
                color: Colors.white,
                fontSize: setHeight(14),
                fontWeight: FontWeight.bold,
                letterSpacing: 0),
          ),
        ),
        SizedBox(height: setHeight(12)),
        Column(
          children: [
            seatBlock("reserved"),
            Divider(
                color: Color(0xFF282828),
                thickness: 2.1,
                height: setHeight(23)),
            seatBlock("booked"),
            Divider(
                color: Color(0xFF282828),
                thickness: 2.1,
                height: setHeight(23)),
            seatBlock("booked"),
            Divider(
                color: Color(0xFF282828),
                thickness: 2.1,
                height: setHeight(23)),
            seatBlock("available"),
            Divider(
                color: Color(0xFF282828),
                thickness: 2.1,
                height: setHeight(23)),
            seatBlock("available"),
          ],
        )
      ],
    );
  }
}

Widget seatsRowWidget(String sStatus) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          seatCard(seatStatus: sStatus, seatNo: getSeatNumber()),
          seatCard(seatStatus: sStatus, seatNo: getSeatNumber()),
          seatCard(seatStatus: sStatus, seatNo: getSeatNumber()),
        ],
      ),
    ),
    SizedBox(width: setWidth(41)),
    seatCard(seatStatus: sStatus, seatNo: getSeatNumber()),
  ]);
}

Widget seatBlock(String seatStatus) {
  return Column(
    children: [
      seatsRowWidget(seatStatus),
      SizedBox(height: setHeight(7)),
      seatsRowWidget(seatStatus),
    ],
  );
}

// seat card class

class seatCard extends StatefulWidget {
  const seatCard({super.key, required this.seatStatus, required this.seatNo});

  final seatStatus;
  final seatNo;

  @override
  State<seatCard> createState() => _seatCardState();
}

class _seatCardState extends State<seatCard> {
  bool isSeatSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.seatStatus != "reserved" && widget.seatStatus != "booked") {
          setState(() {
            isSeatSelected = !isSeatSelected;
          });
        }
      },
      child: Container(
        height: setHeight(34),
        width: setWidth(34),
        decoration: BoxDecoration(
            color: widget.seatStatus == "reserved"
                ? Color(0x5F282B32)
                : widget.seatStatus == "booked" && Random().nextInt(100) <= 21
                    ? Color(0xFFD84F4F)
                    : isSeatSelected
                        ? Color(0xFF2475EE)
                        : Color(0xFF282B32),
            borderRadius: BorderRadius.circular(5),
            border: isSeatSelected
                ? Border.all(color: Colors.white, width: 1.6)
                : Border()),
        child: Center(
          child: Text(
            widget.seatNo < 10 ? "0${widget.seatNo}" : "${widget.seatNo}",
            style: TextStyle(
                color: widget.seatStatus == "reserved"
                    ? Color.fromARGB(65, 255, 255, 255)
                    : Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                fontSize: setHeight(14)),
          ),
        ),
      ),
    );
  }
}

int getSeatNumber() {
  if (seatNumber >= 40) {
    seatNumber = 0;
  }
  seatNumber = seatNumber + 1;
  return seatNumber;
}
