

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erwini/history.dart';
import 'package:erwini/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';
import 'map.dart';
import 'measures.dart';
import 'notifications.dart';

class wells extends StatefulWidget {
  const wells({Key? key}) : super(key: key);

  @override
  State<wells> createState() => _wellsState();
}

class _wellsState extends State<wells> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: waveclipper(),
          child: Container(
            color: const Color.fromARGB(255, 11, 164, 105),
            height: 130,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ":  الأبار ",
              style: GoogleFonts.workSans(
                  fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),

     ]
      )

    ));


  }
}
