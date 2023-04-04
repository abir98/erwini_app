import 'dart:async';

import 'package:erwini/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Mysplash extends StatefulWidget {
  const Mysplash({Key? key}) : super(key: key);

  @override
  State<Mysplash> createState() => _MysplashState();
}

class _MysplashState extends State<Mysplash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
    ()=>Navigator.pushReplacement(context,
    MaterialPageRoute(builder:
    (context) =>login()
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 164, 105),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child :Image.asset('images/logo.png', scale: 3)),
            Center(
              child: Text(
                'Water is life ',
                textAlign:  TextAlign.center,
                style:  GoogleFonts.paytoneOne(
                  fontSize:  40,
                  fontWeight:  FontWeight.w400,
                  height:  0.75,
                  color:  Color(0xffffffff),
                ),
              ),
            ),

          ],
        )
    );
  }
}

