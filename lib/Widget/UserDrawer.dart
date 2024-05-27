import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:tablet/screens/Animations.dart';
import 'package:tablet/screens/UserScreen.dart';

import '../Data/Pills.dart';
import '../Database/Hive.dart';
import '../Database/models/User.dart';
import '../Database/models/gender.dart';

class UserDrawer extends StatefulWidget {
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  Color color = Colors.blueGrey;
  bool settingup = true;
  bool isUser = false;
  User user = User(
      name: "Guest",
      age: 18,
      gender: Gender.Others,
      phno: "000000000",
      email: "guest");
  Box? userbox;
  void setupUser(User? user) async {}

  void setup() async {
    bool x = await HiveData().boxIsEmpty('User');
    setState(() {
      settingup = true;
      isUser = x;
    });
    userbox = await HiveData().getHiveBox('User');
    User user1 = await HiveData().getUser();
    setState(() {
      user = user1;
      settingup = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  Widget logedUser() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 50,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.person_rounded,
                color: color,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                user.name,
                style: GoogleFonts.lexend(fontSize: 15),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.alternate_email_rounded,
                color: color,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                user.email!,
                style: GoogleFonts.lexend(fontSize: 15),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.phone_rounded,
                color: color,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                user.phno,
                style: GoogleFonts.lexend(fontSize: 15),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                user.gender == Gender.Male
                    ? Icons.man_2_rounded
                    : user.gender == Gender.Female
                        ? Icons.woman_2_rounded
                        : Icons.transgender_rounded,
                color: color,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                user.gender.name,
                style: GoogleFonts.lexend(fontSize: 15),
              )
            ],
          ),
          TextButton.icon(
              onPressed: () {}, icon: Icon(Icons.logout), label: Text("Logout"))
        ],
      ),
    );
  }

  void logoutUser() async {
    await userbox!.deleteAt(0);
  }

  Widget build(context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: isUser ? logedUser() : UserScreen(),
    );
  }
}
