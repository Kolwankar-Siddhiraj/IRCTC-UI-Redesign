// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:irctc_ui/homescreen/select_seat.dart';
import 'package:irctc_ui/utils.dart';

class ProceedToBookButtonWidget extends StatefulWidget {
  const ProceedToBookButtonWidget({super.key});

  @override
  State<ProceedToBookButtonWidget> createState() =>
      _ProceedToBookButtonWidgetState();
}

class _ProceedToBookButtonWidgetState extends State<ProceedToBookButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(100),
      color: Color(0xFF1D1F24),
      padding: EdgeInsets.only(
          right: setWidth(30), bottom: setHeight(14), left: setWidth(30)),
      child: Column(
        children: [
          SizedBox(height: setHeight(12)),
          Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "SUR Express (134556), 3AC",
                        style: TextStyle(
                            color: Color(0xFF8F8F8F),
                            fontWeight: FontWeight.bold,
                            fontSize: setHeight(13),
                            letterSpacing: 0),
                      ),
                      SizedBox(height: setHeight(10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.currency_rupee_rounded,
                            color: Color(0xFF8F8F8F),
                            size: setHeight(23),
                          ),
                          Text(
                            "1999.00",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                //   color: Color(0xFF2475EE),
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: setHeight(23)),
                          ),
                        ],
                      )
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectSeatScreen()));
                    },
                    child: Container(
                      height: setHeight(55),
                      decoration: BoxDecoration(
                          color: Color(0xFF2475EE),
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: Text(
                          "Proceed to Book",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: setHeight(18),
                              letterSpacing: 0),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
