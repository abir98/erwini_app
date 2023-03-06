import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erwini/widgets/header.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class wells extends StatefulWidget {
  const wells({Key? key}) : super(key: key);

  @override
  State<wells> createState() => _wellsState();
}

class _wellsState extends State<wells> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("الأبار "),
      ])),
      bottomNavigationBar: CurvedNavigationBar(
        height: 66,
        backgroundColor: Colors.transparent,
        color: c1,
        animationDuration: Duration(milliseconds: 300),
        onTap: (value) => {},
        items: const [
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
      ),
    );
  }
}
