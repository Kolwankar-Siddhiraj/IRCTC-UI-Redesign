// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:irctc_ui/utils.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF010101),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Help",
              style: TextStyle(
                  fontSize: setHeight(18),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2475EE)),
            ),
          ],
        ),
      ),

      // body
      body: Container(
        width: double.maxFinite,
        color: Color(0xFF010101),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
                
            ),
            Image.asset("sf/img/logo_n.png",
                height: setHeight(130), width: setWidth(100)),

            SizedBox(height: setHeight(16)),
            Text(
              "Enter your PIN",
              style: TextStyle(
                color: Colors.white,
                fontSize: setHeight(32),
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: setHeight(5)),
            Text(
              "4 digit login pin for @user_id",
              style: TextStyle(
                color: Color.fromARGB(150, 255, 255, 255),
                fontSize: setHeight(13),
                fontWeight: FontWeight.w500,
              ),
            ),

            // pin input
            SizedBox(height: setHeight(50)),
            SizedBox(
              width: setWidth(140),
              child: PinInputTextField(
                pinLength: 4,
                autoFocus: true,
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: setHeight(37)),
				  lineStrokeCap: StrokeCap.round,
                  colorBuilder:
                      PinListenColorBuilder(Colors.green, Color(0xFF363636)),
                  lineHeight: 5,
                  gapSpace: 12,
                  obscureStyle: ObscureStyle(
                    isTextObscure: true,
                    obscureText: '*',
                  ),
                ),
                textInputAction: TextInputAction.go,
                enabled: true,
                keyboardType: TextInputType.number,
                onChanged: (pin) {
                  debugPrint('onChanged execute. pin:$pin');
                },
              ),
            ),
	
			// forgot pin
            SizedBox(height: setHeight(50)),
			Container(
				width: setWidth(100),
				height: setHeight(50),
				decoration: BoxDecoration(
					color: Color(0xFF2475EE)
				),
			),
		  
		  
		  ],
        ),
      ),
    );
  }
}
