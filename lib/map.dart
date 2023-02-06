import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class mymap extends StatefulWidget {
  const mymap({Key? key}) : super(key: key);

  @override
  State<mymap> createState() => _mymapState();
}

class _mymapState extends State<mymap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(

      ),
    bottomNavigationBar:CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: c1,
      animationDuration: Duration(milliseconds: 300 ),
      onTap: (value) => {

      },
      items: [

        Icon(Icons.home,color: Colors.white,size: 35,),
        Icon(Icons.location_on,color: Colors.white,size: 35,),
        Icon(Icons.settings,color: Colors.white,size: 35,),
        Icon(Icons.notifications,color: Colors.white,size:35)
      ],
      
    )

    );
  }
}
