

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erwini/pages/history.dart';
import 'package:erwini/pages/wells.dart';
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
      ),
    );
  }
}
