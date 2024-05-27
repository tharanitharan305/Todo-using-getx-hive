import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:tablet/screens/Home.dart';

import '../Database/Hive.dart';

class LaunchScreen extends StatelessWidget {
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            Container(
              height: size.height * 0.6,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/launch.jpg'),
                      fit: BoxFit.fill),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(250))),
            ),
            // const Padding(
            //     padding: EdgeInsets.only(left: 18.0),
            //     child: Align(
            //       alignment: Alignment.topLeft,
            //       child: CircleAvatar(
            //           radius: 30,
            //           backgroundColor: Colors.transparent,
            //           foregroundImage: AssetImage('assets/images/icon.jpg')),
            //     )),
            SizedBox(
              height: size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      "Let's start your\nhealthy journey\ntoday with us!",
                      style: GoogleFonts.lexend(
                          color: Colors.white, fontSize: 32, letterSpacing: 2)),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () async {
                await HapticFeedback.vibrate();
                Get.offNamed('/userScreen');
              },
              child: Text('Continue'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: Size(size.width * 0.7, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
