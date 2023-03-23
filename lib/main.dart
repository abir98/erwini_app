

import 'package:erwini/history.dart';
import 'package:erwini/login.dart';
import 'package:erwini/map.dart';
import 'package:erwini/measures.dart';
import 'package:erwini/splash.dart';
import 'package:erwini/wells.dart';
import 'package:flutter/material.dart';

import 'notifications.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Mysplash(),
        '/login': (context) => const login(),
        '/measures': (context) => const measure(),
        '/map': (context) => const mymap(),
        '/wells': (context) => const wells(),
        '/history':(context)=> const History(),
        '/notifications':(context)=> const Notifications(),

      },
    );
  }
}
