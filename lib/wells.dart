import 'package:erwini/widgets/header.dart';
import 'package:erwini/widgets/lottie_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wells extends StatefulWidget {
  const Wells({super.key});

  @override
  _WellsState createState() => _WellsState();
}

class _WellsState extends State<Wells> {
  List<String> Wells = [
    " البئر1   ",
    " البئر2    ",
    " البئر3   ",
    " البئر1   ",
    " البئر1   ",
    " البئر1   ", " البئر1   ", " البئر1   ", " البئر1   ",
  ];
  List<bool> wellStatusList = List.generate(3, (index) => false);
  bool _switchValue = false;

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
                width: double.infinity),
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ":  الأبار ",
                style: GoogleFonts.workSans(
                    fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ListView.builder(
            itemCount: Wells.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 150,
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    trailing: Text(
                      Wells[index],
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.workSans(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    leading: Switch(
                      onChanged: (value) {},
                      value: _switchValue,
                    ),
                    subtitle: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/calendar.gif'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Your code here
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ])));
  }
}
