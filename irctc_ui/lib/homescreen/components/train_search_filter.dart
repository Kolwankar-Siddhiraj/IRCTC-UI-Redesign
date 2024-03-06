// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class SearchTrainFilterCardWidget extends StatefulWidget {
  const SearchTrainFilterCardWidget({super.key, required this.title});
  final title;

  @override
  State<SearchTrainFilterCardWidget> createState() =>
      _SearchTrainFilterCardWidgetState();
}

class _SearchTrainFilterCardWidgetState
    extends State<SearchTrainFilterCardWidget> {
  bool isFilterActive = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFilterActive = !isFilterActive;
        });
      },
      child: Container(
        height: setHeight(45),
        padding: EdgeInsets.symmetric(horizontal: setWidth(16)),
        decoration: BoxDecoration(
            color: Color(0xFF282B32),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                width: 2,
                color: isFilterActive ? Color(0xFF2475EE) : Color(0xFF282B32))),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(fontSize: setHeight(16), color: Colors.white),
          ),
        ),
      ),
    );
  }
}
