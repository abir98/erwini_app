

import 'package:erwini/pages/history.dart';
import 'package:erwini/pages/homepage.dart';
import 'package:erwini/pages/login.dart';
import 'package:erwini/pages/map.dart';
import 'package:erwini/pages/measures.dart';
import 'package:erwini/pages/splash.dart';
import 'package:erwini/pages/wells.dart';
import 'package:erwini/widgets/language_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/notifications.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Configure your app to handle incoming FCM messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle the incoming message
  });

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
  static void SetLocale(BuildContext context, Locale newLocale){
    _MyAppState? state=context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }



}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale){
    setState(() {
      _locale=locale;
    });
  }



  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Mysplash(),
          '/login': (context) => const login(),
          '/measures': (context) => const measure(),
          '/map': (context) => const mymap(),
          '/wells': (context) => Wells(),
          '/history': (context) => const History(),
          '/notifications': (context) => const Notifications(),
          '/homepage': (context) => const homepage(),
        },

    );

  }
}