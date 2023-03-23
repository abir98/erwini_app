

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erwini/history.dart';
import 'package:erwini/wells.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'measures.dart';
import 'notifications.dart';
class mymap extends StatefulWidget {
  const mymap({Key? key}) : super(key: key);

  @override
  State<mymap> createState() => _mymapState();
}

class _mymapState extends State<mymap> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Center(
          child:Text("hello world")
        )

      ), bottomNavigationBar: CurvedNavigationBar(
      height: 66,
      backgroundColor: Colors.transparent,
      color: c1,
      animationDuration: const Duration(milliseconds: 300),

      items:  [
        Icon(
          Icons.home,
          color: Colors.white,
          size: 35,
        ),
        Icon(
          Icons.location_on,
          color: Colors.white,
          size: 35,
        ),
        Icon(
          Icons.settings,
          color: Colors.white,
          size: 35,
        ),
        Icon(
          Icons.history,
          color: Colors.white,
          size: 35,
        ),
        Icon(Icons.notifications, color: Colors.white, size: 35)
      ],

    )
    );
  }
}
