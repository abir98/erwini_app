import 'package:erwini/login.dart';
import 'package:erwini/splash.dart';
import 'package:flutter/material.dart';
import 'package:erwini/login.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Mysplash(),
        '/login': (context) => const login(),
      },

    );
  }
}



