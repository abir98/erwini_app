
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scaled_list/scaled_list.dart';

import '../services/SensorService.dart';

import '../widgets/header.dart';
import '../widgets/language_constants.dart';
import 'login.dart';


class measure extends StatefulWidget {
  const measure({Key? key}) : super(key: key);

  @override
  State<measure> createState() => _measureState();
}


class _measureState extends State<measure> {

  late String arbre = " النخيل ";
  final List<Color> kMixedColors = [
    Colors.lightGreen
  ];

   SensorService sensorservice = SensorService();

  @override
  void initState() {
    sensorservice.startRefreshTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    sensorservice.stopRefreshTimer();
    super.dispose();
  }

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
            width: MediaQuery.of(context).size.width,
            height: 250,
          ),
        ),
      ),
      body: StreamBuilder(
        stream:  sensorservice.onData,
       builder:(context, AsyncSnapshot<List<dynamic>> snapshot)
      {
    if (snapshot.hasData) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print(sensorservice.sensorData.length);
          return ListView.builder(
            itemCount: sensorservice.sensorData.length,
            itemBuilder: (context, index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/branche.gif",
                          scale: 7.0,
                        ),
                        SizedBox(width: 40),
                        Text("Zone ${(index + 1).toString()}",
                          style: GoogleFonts.workSans(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                          "$arbre : ${translation(context).implants}",
                          style: GoogleFonts.workSans(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ]),
                    ScaledList(
                        showDots: true,
                        itemCount: sensorservice.sensorData[index]['capteurs']
                            .length,
                        itemColor: (index) {
                          return kMixedColors[index % kMixedColors.length];
                        },
                        marginWidthRatio: 0.1,
                        cardWidthRatio: 0.4,
                        itemBuilder: (subIndex, selectedIndex) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                sensorservice
                                    .sensorData[index]['capteurs'][subIndex]['Type']
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              CircularPercentIndicator(
                                animation: true,
                                radius: 70,
                                lineWidth: 10,
                                percent: sensorservice
                                    .sensorData[index]['capteurs'][subIndex]['Mesure'] /
                                    100,
                                progressColor: c1,
                                backgroundColor: Colors.white,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text(
                                  sensorservice
                                      .sensorData[index]['capteurs'][subIndex]['Mesure']
                                      .toString(),
                                  style: TextStyle(fontSize: 24),
                                ),
                                animationDuration: 1000,
                              ),
                            ],
                          );
                        }
                    )
                  ]
              );
            },
          );
        },
      );

         }
       else if (snapshot.hasError) {
      return Center(
        child: Text('Error loading data'),
      );
    }
      else return  Center(
        child: CircularProgressIndicator(),
      );
      }

      )

    );
  }
}


