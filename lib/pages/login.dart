import 'dart:convert';

import 'package:erwini/pages/measures.dart';
import 'package:erwini/widgets/header.dart';
import 'package:erwini/widgets/language_constants.dart';
import 'package:erwini/widgets/languages.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import"package:http/http.dart" as http;
import 'package:intl_phone_field/phone_number.dart';
import '../main.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

Color c1 = const Color.fromARGB(255, 11, 164, 105);


Future<Map<String, dynamic>> loginuser(phone,password) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/api/auth/signin'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'phone': phone, 'password': password}),
  );
  if (response.statusCode == 200) {
    // Login successful, return user data
    return jsonDecode(response.body);
  } else if (response.statusCode == 401) {
    // Invalid credentials
    throw Exception('Invalid phone or password');
  } else {
    // Something went wrong
    throw Exception('Failed to login');
  }
}


class _loginState extends State<login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   late PhoneNumber phone;
   var password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
              child: DropdownButton<languages>(
                underline: const SizedBox(
                ),
                icon: Icon(Icons.language,
                color: Colors.white,size: 30,),
                onChanged:(languages? languages) async {
                           if(languages !=null){
                             Locale _locale = await setLocale(languages.languageCode);
                             MyApp.SetLocale(context,Locale(languages.languageCode,""));
                           }
                },
                items: languages.languagelist()
                    .map<DropdownMenuItem<languages>>(
                      (e) => DropdownMenuItem<languages>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ],
          toolbarHeight: 138,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: waveclipper(),
            child: Container(
              color: const Color.fromARGB(255, 11, 164, 105),
              width: MediaQuery.of(context).size.width,
              height: 250,

            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(8),
                child: Image.asset("images/vertbgblanc.png", scale: 3)),
            Container(
              margin: EdgeInsets.all(9),
              padding: EdgeInsets.fromLTRB(37, 34, 36, 63),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: c1,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntlPhoneField(

                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIconColor: c1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    initialCountryCode: 'TN',
                    controller: phoneController,
                    onChanged: (value) {
                      phone = value;
                    },
                  ),
                  SizedBox(
                    width: 400,
                    child: FancyPasswordField(
                      decoration: InputDecoration(
                        prefixIconColor: c1,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      validationRuleBuilder: (rules, value) {
                        if (value.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return ListView(
                          shrinkWrap: true,
                          children: rules
                              .map(
                                (rule) => rule.validate(value)
                                    ? Row(
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            rule.name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            rule.name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                              )
                              .toList(),
                        );
                      },
                      controller: passwordController,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: 290,
                    child: ElevatedButton(
                      onPressed: () {
                        loginuser(phone.toString(), password);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(translation(context).login,
                          style: GoogleFonts.workSans(
                              color: c1,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

