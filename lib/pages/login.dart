import 'package:erwini/widgets/header.dart';
import 'package:erwini/widgets/language_constants.dart';
import 'package:erwini/widgets/languages.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import "package:http/http.dart" as http;

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:validators/validators.dart';
import '../main.dart';
import '../models/login_request_model.dart';
import '../services/authservice.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

Color c1 = const Color.fromARGB(255, 11, 164, 105);

bool validateandSave() {
  final form = GlobalKey<FormState>().currentState;
  if (form != null) {
    if (form.validate() == true) {
      form.save();
      return true;
    }
    else
      return false;
  }
  return true;
}

class _loginState extends State<login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey <FormState>();

  String? phone ;
  String? password;
  bool isAPIcallprocess = false;

  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'TN');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<languages>(
                underline: const SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 30,
                ),
                onChanged: (languages? languages) async {
                  if (languages != null) {
                    Locale _locale = await setLocale(languages.languageCode);
                    MyApp.SetLocale(
                        context, Locale(languages.languageCode, ""));
                  }
                },
                items: languages
                    .languagelist()
                    .map<DropdownMenuItem<languages>>(
                      (e) =>
                      DropdownMenuItem<languages>(
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InternationalPhoneNumberInput(
                      keyboardType: TextInputType.phone,
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        trailingSpace: false,
                        useEmoji: true,


                      ),
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      initialValue: _phoneNumber ,
                      inputDecoration: InputDecoration(
                        prefixIconColor: c1,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),

                      onInputChanged: (PhoneNumber value) {
                        phone = value.phoneNumber!;
                      },

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "phone is required";
                        }
                        return null; // Return null if validation passes
                      },

                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
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
                          controller: passwordController,
                          onChanged: (value) {
                            password = value;
                          },

                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: 290,
                      child: ElevatedButton(
                        onPressed: () {
                          if (validateandSave()) {
                            setState(() {
                              isAPIcallprocess = true;
                            });
                            login_request_model model = login_request_model(
                                phone: phone, password: password);
                             authservice.login(model).then((response )=> {
                                if(response){
                                  Navigator.pushNamedAndRemoveUntil(context,'/homepage', (route) => false)
                                }
                                else { AlertDialog(
                                  title: Text("error login"),
                                )

                                }
                             });
                          }
                        }
                        ,
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
            ),
          ],
        ));
  }

}
