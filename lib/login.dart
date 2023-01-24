import 'package:erwini/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


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
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[ Image.asset("images/vertbgblanc.png" ,scale:3 ),
    Container(
      margin: EdgeInsets.all(15),
    padding:  EdgeInsets.fromLTRB(37, 34, 36, 63),
    width:  double.maxFinite,
    decoration:  BoxDecoration (
    color:  Color(0xff0ba469),
    borderRadius:  BorderRadius.circular(30),
    ),
     child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children: [
      Text("تسجيل الدخول " ,
        textAlign: TextAlign.center,
        style:GoogleFonts.workSans(
            color: Colors.white,
              fontSize: 32,fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 4,
      ),
      IntlPhoneField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
       initialCountryCode: 'TN',
        onChanged: (phone){
        print(phone.completeNumber);
        },
      ),
      TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border:OutlineInputBorder(
    borderRadius:BorderRadius.circular(20
        ),
      ),
        ),
    ),
       ],
    ),
    ),
    ],
    )
    ]

    );
  }
}


