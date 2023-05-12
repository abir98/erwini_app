import 'package:flutter/material.dart';

import '../widgets/header.dart';



class Switching extends StatelessWidget {
  const Switching({Key? key}) : super(key: key);

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
              width: double.infinity),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              GestureDetector(
                onTap: () =>
                Navigator.pushNamed(context, '/wells'),
                child: Card(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/puits.png',height:180,width:170),
                      Text('wells', style:  TextStyle(fontSize: 24)),
                      SizedBox(
                        height: 50,
                      )

                    ],
                  ),
                ),
              ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: ()=> Navigator.pushNamed(context, '/vanne')
              ,
              child: Card(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/vanne.png',height:180,width:170),
                    Text('vannes', style:  TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 50,
                    )

                  ],

                ),
              ),
            ),


          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, '/pump'),
                child: Card(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/pompe.png',height:180,width:170),
                      Text('pumps', style:  TextStyle(fontSize: 24)),
                      SizedBox(
                        height: 50,
                      )

                    ],
                  ),
                ),
              ),

            ],
          )
      ]
      ),
    );
  }
}
