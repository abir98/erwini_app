import 'package:erwini/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'login.dart';

class Wells extends StatefulWidget {
  const Wells({super.key});

  @override
  _WellsState createState() => _WellsState();
}

class _WellsState extends State<Wells> {
  List<String> Wells = [
    " البئر 1   ",
    " البئر2     ",
    " البئر 2    ",
    " البئر 2    ",
    " البئر 2    ",
    " البئر 2    ",
    " البئر 2    ",
    " البئر 2    ",
  ];
  List<bool> wellStatusList = List.generate(3, (index) => false);
  bool _switchValue = false;

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
                width: double.infinity),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: FittedBox(
                        fit:BoxFit.fill,
                        child:
                        IconButton(onPressed:(){}, icon:Image.asset('images/plus.png'))),
                  ),
                  Text(
                    ":  الأبار ",
                    style: GoogleFonts.workSans(
                        fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 800,
                width: 600,
                child: ListView.builder(
                  itemCount: Wells.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 200,
                      child: Card(
                        elevation: 2.0,
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                Wells[index],
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.workSans(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal),
                              ),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                ],
                              ),

                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoSwitch(
                                  value: _switchValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _switchValue = value;
                                    });
                                  },
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()),
                                      );
                                    },
                                    //
                                    child: Image.asset('images/calendar.png')),
                              ],
                            ),
                              ],

                        ),
                      ),
                    );
                  },
                ),
              ),
            ])));
  }
}
