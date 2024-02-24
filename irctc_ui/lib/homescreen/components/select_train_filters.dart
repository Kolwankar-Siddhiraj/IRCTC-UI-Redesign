// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';

class SelectTrainFiltersWidget extends StatefulWidget {
  const SelectTrainFiltersWidget({super.key});

  @override
  State<SelectTrainFiltersWidget> createState() =>
      _SelectTrainFiltersWidgetState();
}

class _SelectTrainFiltersWidgetState extends State<SelectTrainFiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            filterButton(true, false, title: "Available"),
            SizedBox(width: setWidth(7)),
            filterButton(true, true,
                title: "Quota", icon: Icons.keyboard_arrow_down_rounded),
          ],
        ),
        Row(
          children: [
            filterButton(true, true,
                title: "Sort", icon: Icons.keyboard_arrow_down_rounded),
            SizedBox(width: setWidth(7)),
            filterButton(false, true, icon: Icons.filter_alt_outlined)
          ],
        ),
      ],
    );
  }

  Widget filterButton(bool hasTitle, bool hasIcon,
      {String? title, IconData? icon}) {
    return Container(
      height: setHeight(37),
      padding: EdgeInsets.symmetric(horizontal: setWidth(14)),
      decoration: BoxDecoration(
          color: Color(0xFF1D1F24), borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          hasTitle
              ? Text(
                  title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: setHeight(13)
                  ),
                )
              : SizedBox(width: 0),
          hasTitle & hasIcon ? SizedBox(width: setWidth(5)) : SizedBox(width: 0),
          hasIcon
              ? Icon(icon, size: setHeight(30), color: Color(0xFF6D6E7C))
              : SizedBox(width: 0)
        ],
      ),
    );
  }
}
