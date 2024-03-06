// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class StationNameTextWidget extends StatefulWidget {
  const StationNameTextWidget(
      {super.key, required this.stationName, required this.stationCode, required this.isSourceStation});

  final stationName;
  final stationCode;
  final isSourceStation;

  @override
  State<StationNameTextWidget> createState() => _StationNameTextWidgetState();
}

class _StationNameTextWidgetState extends State<StationNameTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: setWidth(30), vertical: setHeight(5)),
      child: Column(
        crossAxisAlignment: widget.isSourceStation ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            widget.stationCode,
            style: TextStyle(
              color: Colors.white,
              fontSize: setHeight(25),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.stationName,
            style: TextStyle(
              color: Color(0xFF8F8F8F),
              fontSize: setHeight(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
