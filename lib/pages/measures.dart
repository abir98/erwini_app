import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erwini/pages/history.dart';
import 'package:erwini/pages/notifications.dart';
import 'package:erwini/pages/wells.dart';
import 'package:erwini/widgets/header.dart';
import 'package:erwini/widgets/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'login.dart';
import 'map.dart';

class measure extends StatefulWidget {
  const measure({Key? key}) : super(key: key);

  @override
  State<measure> createState() => _measureState();
}

class _measureState extends State<measure> {
  late int zone = 1;
  late String arbre = " النخيل ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: waveclipper(),
          child: Container(
            color: const Color.fromARGB(255, 11, 164, 105),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 250,
          ),
        ),
      ),

     body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset("images/branche.gif",scale: 7.0,),
                SizedBox(width:40),
                Text(
                    " ${translation(context).zone} : $zone ",
                  style: GoogleFonts.workSans(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),

              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("$arbre : ${translation(context).implants}",
                  style: GoogleFonts.workSans(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ]),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('الحرارة الخارجية '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(" 30 %", style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('حرارة التربة '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: const Text(" 30 %",
                                style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('الحرارة الخارجية '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: const Text(" 30 %",
                                style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('حرارة التربة '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(" 30 %", style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('الحرارة الخارجية '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(" 30 %", style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('حرارة التربة '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: const Text(" 30 %",
                                style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('الحرارة الخارجية '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(" 30 %", style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
                Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('حرارة التربة '),
                          CircularPercentIndicator(
                            animation: true,
                            radius: 70,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: c1,
                            backgroundColor: Colors.lightGreen,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(" 30 %", style: TextStyle(fontSize: 24)),
                            animationDuration: 1000,
                          )
                        ],
                      ),
                    )),
              ],
            ),
        ]),
          )

     );
  }
}
