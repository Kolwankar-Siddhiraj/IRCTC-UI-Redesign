// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            right: setWidth(19),
            left: setWidth(19),
            top: setHeight(12),
            bottom: setHeight(25)),
        height: setHeight(110),
        color: Color(0xFF1D1F24),
        child: GNav(
            tabBorderRadius: 21,
            duration: Duration(milliseconds: 1000),
            gap: 7,
            color: Color(0xFF9A9A9A),
            activeColor: Colors.white,
            iconSize: setHeight(32),
            tabBackgroundColor: Color(0xFF2475EE),
            padding: EdgeInsets.symmetric(
                horizontal: setWidth(12), vertical: setHeight(9)),
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: setHeight(18),
                color: Colors.white),
            tabs: [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.public,
                text: 'Public',
              ),
              GButton(
                icon: Icons.account_circle_rounded,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.more_horiz_rounded,
                text: 'More',
              )
            ]));
  }
}
