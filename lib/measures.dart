import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erwini/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'login.dart';
class measure extends StatefulWidget {
  const measure({Key? key}) : super(key: key);

  @override
  State<measure> createState() => _measureState();
}

class _measureState extends State<measure> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(clipper: waveclipper(),
              child:
              Container(
                color:const Color.fromARGB(255, 11, 164, 105),
                height: 130,
              ),
            ),


          ],
        ),
      )



,

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
