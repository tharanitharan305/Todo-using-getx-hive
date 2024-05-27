import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tablet/Database/Hive.dart';
import 'package:tablet/Widget/DateTime.dart';
import 'package:tablet/Widget/TodoList.dart';
import 'package:tablet/Widget/TodoSlider.dart';
import 'package:tablet/Widget/Scorecard.dart';
import 'package:tablet/Widget/getTask.dart';
import 'package:tablet/screens/Animations.dart';
import 'package:tablet/screens/UserScreen.dart';

import '../Widget/UserDrawer.dart';

class Home extends StatefulWidget {
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(243, 244, 246, 1),
        drawer: UserDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(243, 244, 246, 1),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10),
              child: ShowDigitalClock(),
            ),
          ],
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 8),
          //   child: CircleAvatar(child: MaterialButton(onPressed: () {
          //     Scaffold.of(context).openDrawer();
          //   })),
          // )
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DateTimeGetter().Today(),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Overview",
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Spacer(),
                    OutlinedButton.icon(
                      onPressed: () {
                        HiveData().clearAll('User');
                        HiveData().clearAll('Todo');
                        Get.to(Animations(
                          animationURL: "assets/animations/clean.json",
                          getOff: "/home",
                        ));
                      },
                      label: Text("Clear data"),
                      icon: Icon(Icons.clear_all_rounded),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                    )
                  ],
                ),
                ScoreCard(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Upcoming",
                    style: GoogleFonts.lexend(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                TodoSlider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Todo",
                    style: GoogleFonts.lexend(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                TodoList()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          Get.bottomSheet(
              elevation: 10,
              BottomSheet(
                onClosing: () {},
                builder: (context) => GetTask(),
              ));
        }),
      ),
    );
  }
}
