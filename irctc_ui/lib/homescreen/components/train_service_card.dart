// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class TrainServiceCardWidget extends StatefulWidget {
  const TrainServiceCardWidget({
    super.key,
    required this.imgPath,
    required this.title,
    required this.description,
    required this.imgColor,
    required this.cardColor,
  });

  final imgPath;
  final title;
  final description;
  final imgColor;
  final cardColor;

  @override
  State<TrainServiceCardWidget> createState() => _TrainServiceCardWidgetState();
}

class _TrainServiceCardWidgetState extends State<TrainServiceCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: setWidth(188),
      height: setHeight(188),
      padding: EdgeInsets.symmetric(
          horizontal: setWidth(19), vertical: setHeight(19)),
      decoration: BoxDecoration(
          color: widget.cardColor, borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(setHeight(18)),
            width: setWidth(70),
            height: setHeight(70),
            decoration: BoxDecoration(
                color: widget.imgColor,
                borderRadius: BorderRadius.circular(12)),
            child: Image.asset(
              widget.imgPath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: setHeight(7)),
          Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: setHeight(25),
                letterSpacing: 0),
          ),
          Text(
            widget.description,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(180, 255, 255, 255),
                fontSize: setHeight(13),
                letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}
