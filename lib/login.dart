import 'package:erwini/widgets/header.dart';
import 'package:flutter/material.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
Color c1 = const Color(0x000ba469);
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flutterlogin()
    );
  }
}

class flutterlogin extends StatefulWidget {
  const flutterlogin({Key? key}) : super(key: key);

  @override
  State<flutterlogin> createState() => _flutterloginState();
}

class _flutterloginState extends State<flutterlogin> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget> [
        ClipPath(clipper: waveclipper(),
          child:
          Container(
            color:const Color.fromARGB(255, 11, 164, 105),
            height: 130,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ Image.asset("images/vertbgblanc.png" , scale:3 ),
            Container(
            color: const Color.fromARGB(255, 11, 164, 105),
            child:
                   const TextField( decoration: InputDecoration(

                       border: InputBorder.none,
                       labelText: 'Enter Name',
                       hintText: 'Enter Your Name')),
            ),

          ]),

       ],
    );
  }
}


