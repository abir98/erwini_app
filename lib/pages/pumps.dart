
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../widgets/header.dart';
class Pump extends StatefulWidget {
   const Pump({Key? key}) : super(key: key);

   @override
   State<Pump> createState() => _PumpState();
 }
List<String> pumps = [
  "pump 1",
  "pump2"
];
List<bool> wellStatusList = List.generate(3, (index) => false);
bool _switchValue = true;
 class _PumpState extends State<Pump> {
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
                         fit: BoxFit.fill,
                         child: IconButton(
                             onPressed: () {},
                             icon: Image.asset('images/plus.png'))),
                   ),
                   Text(
                     " pumps ",
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
                   itemCount: pumps.length,
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
                                 pumps[index],
                                 textDirection: TextDirection.rtl,
                                 style: GoogleFonts.workSans(
                                     fontSize: 30,
                                     fontWeight: FontWeight.normal),
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
                                     onTap: () async {
                                       List<DateTime>? dateTimeList = await showOmniDateTimeRangePicker(
                                         context: context,
                                         startInitialDate: DateTime.now(),
                                         startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
                                         startLastDate: DateTime.now().add(const Duration(days: 3652)),
                                         endInitialDate: DateTime.now(),
                                         endFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
                                         endLastDate: DateTime.now().add(const Duration(days: 3652)),
                                         is24HourMode: false,
                                         isShowSeconds: false,
                                         //change minutesInterval to timeInterval
                                         secondsInterval: 1,
                                         borderRadius: const BorderRadius.all(Radius.circular(16)),
                                         constraints: const BoxConstraints(maxWidth: 350, maxHeight: 650),
                                         transitionBuilder: (context, anim1, anim2, child) {
                                           return FadeTransition(
                                             opacity:
                                             anim1.drive(Tween(begin: 0, end: 1)),
                                             child: child,
                                           );
                                         },
                                         transitionDuration:
                                         const Duration(milliseconds: 200),
                                         barrierDismissible: true,
                                         selectableDayPredicate: (dateTime) {
                                           // Disable 25th Feb 2023
                                           if (dateTime == DateTime(2023, 2, 25)) {
                                             return false;
                                           } else {
                                             return true;
                                           }
                                         },
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
