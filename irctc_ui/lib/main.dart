// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irctc_ui/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(milliseconds: 1600),
        () => setState(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => GetStartedScreen()));
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body
      body: Container(
        color: Color(0xFF010101),
        child: Center(
          child: Image.asset("sf/img/irctc_logo.png"),
        ),
      ),
    );
  }
}
