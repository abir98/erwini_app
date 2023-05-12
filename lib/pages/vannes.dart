
import "package:flutter/cupertino.dart";
import"package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../widgets/header.dart";

class Vannes extends StatefulWidget {
  const Vannes({Key? key}) : super(key: key);

  @override
  State<Vannes> createState() => _VannesState();
}
List<String> list = [
  "المضخة 1 "
];
List<bool> listStatusList = List.generate(3, (index) => false);
bool _switchValue = true;
class _VannesState extends State<Vannes> {
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
            scrollDirection: Axis.vertical,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('images/plus.png'))),
                  ),
                  Text(
                    ":   المضخات ",
                    style: GoogleFonts.workSans(
                        fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 800,
                width: 600,
                child: ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 200,
                      child: Card(
                        elevation: 2.0,
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                list[index],
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.workSans(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal),
                              ),

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoSwitch(
                                  value: _switchValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _switchValue = value;
                                    });
                                  },
                                )

                    ]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ])));
  }
}
