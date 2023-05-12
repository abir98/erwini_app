

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erwini/pages/history.dart';
import 'package:erwini/pages/switching.dart';
import 'package:erwini/pages/wells.dart';
import'package:erwini/pages/measures.dart';
import 'package:erwini/pages/map.dart';
import 'package:erwini/pages/history.dart';
import 'package:erwini/pages/notifications.dart';
import 'package:erwini/services/shared_service.dart';
import'package:flutter/material.dart';

import '../models/login_response_model.dart';
import 'login.dart';



class homepage extends StatefulWidget {
   const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}
final List<Widget> _pages = [
  mymap(),
  measure(),
  Switching(),
  History(),
  Notifications(),
];
class _homepageState extends State<homepage> {
   PageController _pageController = PageController();
   int _selectedindex= 0;
   void onpagechanged( index){
    _selectedindex = index;
   }
  void _onitemtapped( int _selectedindex){
   _pageController.jumpToPage(_selectedindex);
  }

   @override
   Widget build(BuildContext context) {
     return
     Scaffold(
       body:
           PageView(
             onPageChanged: onpagechanged,
             controller: _pageController,
             children: _pages,
           ),
       bottomNavigationBar: CurvedNavigationBar(
         onTap: _onitemtapped,
         height: 66,
         backgroundColor: Colors.transparent,
         color: c1,
         animationDuration: const Duration(milliseconds: 300),
         items: [
           Icon(
             Icons.location_on,
             color: Colors.white,
             size: 35,
           ),
           Icon(
             Icons.data_thresholding,
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
       )

     ;
   }
}
