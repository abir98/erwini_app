 import'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


 class Lotieswitch extends StatefulWidget {
   const Lotieswitch({Key? key}) : super(key: key);

   @override
   State<Lotieswitch> createState() => _LotieswitchState();
 }
 bool _isSwitchedOn = false;
 class _LotieswitchState extends State<Lotieswitch> {
   @override

   Widget build(BuildContext context) {
     return GestureDetector(
         onTap: () {
           setState(() {
             _isSwitchedOn = !_isSwitchedOn;
           });
         },
         child:
             Lottie.asset(
               'images/onoff.json',
               height: 130,
               width:  90,
               fit: BoxFit.cover,

             ),



     );
   }
 }
