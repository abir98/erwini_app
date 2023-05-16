import "package:erwini/services/Vanneservice.dart";
import "package:flutter/cupertino.dart";
import"package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../widgets/header.dart";

class Vannes extends StatefulWidget {
  const Vannes({Key? key}) : super(key: key);


  @override
  State<Vannes> createState() => _VannesState();
}


class _VannesState extends State<Vannes> {

  VanneService vanneService = VanneService();

  @override
  void initState() {
    // TODO: implement initState
    vanneService.refreshData();
    super.initState();
  }


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
                  child: SizedBox(
                      height: 800,
                      width: 600,
                      child: StreamBuilder(
                          stream: vanneService.onData,
                          builder: (context,
                              AsyncSnapshot<List<dynamic>> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: vanneService.vanneData.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    return SizedBox(
                                        height: 200,
                                        child: Card(
                                            elevation: 2.0,
                                            margin: EdgeInsets.all(15),
                                            child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      "vanne ${(index + 1)
                                                          .toString()}",
                                                      textDirection:
                                                      TextDirection.rtl,
                                                      style: GoogleFonts
                                                          .workSans(
                                                          fontSize: 30,
                                                          fontWeight:
                                                          FontWeight.normal),
                                                    ),
                                                  ),
                                                  Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        CupertinoSwitch(
                                                          value: vanneService
                                                              .vanneData[index]
                                                          ['Etat'] ==
                                                              'ouvert',
                                                          onChanged:
                                                              (
                                                              bool value) async {
                                                            final switchValue = value
                                                                ? 'ouvert'
                                                                : 'fermé';
                                                            try {
                                                              await vanneService
                                                                  .updatestate(
                                                                  switchValue,
                                                                  vanneService
                                                                      .vanneData[
                                                                  index]['_id']);
                                                            } catch (e) {
                                                              // handle error
                                                              print('eror');
                                                            }
                                                            setState(() {
                                                              vanneService
                                                                  .vanneData[
                                                              index]['etat'] =
                                                                  switchValue;
                                                            });
                                                            print(switchValue);
                                                          },
                                                        ),
                                                      ])
                                                ])
                                        )
                                    );
                                  });
                            }
                            else {
                              return Text("hello world");
                            }
                          })))
            ])));
  }}


