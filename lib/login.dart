import 'package:erwini/measures.dart';
import 'package:erwini/widgets/header.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

Color c1 = const Color.fromARGB(255, 11, 164, 105);

class _loginState extends State<login> {
  bool _isObscure = true;
  bool _validPassword = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  final FancyPasswordController _passwordController = FancyPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: waveclipper(),
            child: Container(
              color: const Color.fromARGB(255, 11, 164, 105),
              height: 130,
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
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.fromLTRB(37, 34, 36, 63),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: c1,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "تسجيل الدخول ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.workSans(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  IntlPhoneField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIconColor: c1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    initialCountryCode: 'TN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
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
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: 290,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/measures');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("دخول",
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
