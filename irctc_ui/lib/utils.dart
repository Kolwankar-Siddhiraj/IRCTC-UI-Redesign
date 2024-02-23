// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

var screen = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

int currentTab = 1;

double setWidth(double w) {
  double width = ((screen.width).toInt() / 430) * w;
  dynamic tw = width.toInt();
  width = tw.toDouble();
  return width;
}

double setHeight(double h) {
  double appb = AppBar().preferredSize.height;
  dynamic pixel = ((screen.height).toInt() - appb) / 932;
  dynamic th = (pixel * h).toInt();
  double height = th.toDouble();
  return height;
}

void screenHeightWidth() {
  print("Screen height :: ${screen.height}");
  print("Screen width :: ${screen.width}");
}

void displaySnackBar(context, bool success, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    backgroundColor: success ? Colors.green : Colors.red,
    content: Text(text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'Ok',
      onPressed: () {
        print("OK");
      },
    ),
  ));
}
