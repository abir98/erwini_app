 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';

 class waveclipper extends CustomClipper<Path>{
 @override
 Path getClip(Size size) {
  // TODO: implement getClip
  debugPrint(size.width.toString());
  var path = new Path();
  path.lineTo(0, size.height);//start the path
  //first point
  var firstStart= Offset(size.width ,size.height );
  var firstEnd =Offset(size.width/2.25,size.height - 50.0);
  //second point
  var secondStart= Offset(size.width / 5,size.height );
  var secondEnd =Offset(size.width/2.25,size.height - 50.0);

  path.quadraticBezierTo(firstStart.dx, firstStart.dy,firstEnd.dx, firstEnd.dy);
   var thirdStart = Offset(size.width - (size.width/3.24), size.height - 105);
   var thirdEnd = Offset(size.width,size.height - 13);

   path.quadraticBezierTo(secondStart.dx, secondStart.dy,secondEnd.dx, secondEnd.dy);
   path.lineTo(size.width, 0 );

 path.close();
 return path;
  throw UnimplementedError();
 }

 @override
 bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
  // TODO: implement shouldReclip
  throw UnimplementedError();
 }
}