// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class OtherServiceCardWidget extends StatefulWidget {
  const OtherServiceCardWidget(
      {super.key, required this.title, required this.description});

  final title;
  final description;

  @override
  State<OtherServiceCardWidget> createState() => _OtherServiceCardWidgetState();
}

class _OtherServiceCardWidgetState extends State<OtherServiceCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: setWidth(188),
      height: setHeight(95),
      decoration: BoxDecoration(
          color: Color(0xFF1D1F24), borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: setWidth(25), vertical: setHeight(19)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      ),
    );
  }
}
