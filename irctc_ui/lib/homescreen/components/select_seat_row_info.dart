// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class SeatStatusInfoWidget extends StatefulWidget {
  const SeatStatusInfoWidget({super.key});

  @override
  State<SeatStatusInfoWidget> createState() => _SeatStatusInfoWidgetState();
}

class _SeatStatusInfoWidgetState extends State<SeatStatusInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        seatStatusCard("booked"),
        seatStatusCard("available"),
        seatStatusCard("reserved"),
        seatStatusCard("selected"),
      ],
    );
  }
}

Widget seatStatusCard(String seatStatus) {
  return Row(
    children: [
      Container(
        height: setHeight(28),
        width: setWidth(28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: seatStatus == "selected"
                ? Border.all(color: Colors.white)
                : Border(),
            color: seatStatus == "booked"
                ? Color(0xFFD84F4F)
                : seatStatus == "reserved"
                    ? Color(0x5F1D1F24)
                    : seatStatus == "selected"
                        ? Color(0xFF2475EE)
                        : Color(0xFF1D1F24)),
        child: Center(
          child: Text(
            "00",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: setHeight(12),
                letterSpacing: 0),
          ),
        ),
      ),
      SizedBox(width: setWidth(7)),
      Text(
        seatStatus == "booked"
            ? "Booked"
            : seatStatus == "reserved"
                ? "Reserved"
                : seatStatus == "selected"
                    ? "Selected"
                    : "Available",
        style: TextStyle(
            fontSize: setHeight(12),
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0),
      )
    ],
  );
}
