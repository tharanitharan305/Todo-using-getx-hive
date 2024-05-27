import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:tablet/Database/Hive.dart';
import 'package:tablet/screens/Animations.dart';

import '../Data/Pills.dart';
import '../Database/models/User.dart';
import '../Database/models/gender.dart';
import 'Home.dart';

class UserScreen extends StatefulWidget {
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  final key = GlobalKey<FormState>();
  late String name;
  late int age;
  Gender gender = Gender.Male;
  //DateTime dob;
  late String phno;
  String? email;

  bool settingup = false;
  bool isLogged = false;

  Future<void> saveUser() async {
    final validator = key.currentState!.validate();

    if (validator) {
      key.currentState!.save();
      User gotUser = User(
          age: age,
          gender: gender,
          name: name,
          phno: phno,
          healthScore: 100,
          email: email);
      await HiveData().addUser(gotUser);
      Get.to(Animations(
        animationURL: "assets/animations/adduser.json",
        getOff: "/home",
      ));
      // Get.offAllNamed('/home');
    }
  }

  Widget UserForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Form(
          key: key,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.camera)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Add Profile",
                        style: GoogleFonts.manrope(fontSize: 13),
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (value) {
                  setState(() {
                    name = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Type your name";
                  if (value.length < 3) return "Enter a valid name";
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(243, 244, 246, 1),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintText: "  Enter your name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Type your email";
                  if (value.length < 10 ||
                      !value.contains('@') ||
                      !value.contains('.')) return "Enter a valid email";
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(243, 244, 246, 1),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintText: "  Enter your email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (value) {
                  setState(() {
                    age = int.parse(value!);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Type your age";
                  if (int.tryParse(value) == null) return "Enter a valid age";
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(243, 244, 246, 1),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintText: "  Enter your age",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (value) {
                  setState(() {
                    phno = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Type your phone number";
                  if (int.tryParse(value) == null)
                    return "Enter a valid phone number";
                  if (value.length > 10 || value.length < 10)
                    return "phone number must be 10 digit";
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(243, 244, 246, 1),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintText: "  Enter your phone number",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                      icon: Icon(gender == Gender.Male
                          ? Icons.male_rounded
                          : gender == Gender.Female
                              ? Icons.female_rounded
                              : Icons.transgender),
                      dropdownColor: Color.fromRGBO(243, 244, 246, 1),
                      elevation: 10,
                      borderRadius: BorderRadius.circular(25),
                      value: gender, //Gender.Male.name,
                      items: Gender.values
                          .map((e) => DropdownMenuItem(
                                key: UniqueKey(),
                                child: Text(e.name),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: saveUser,
                  child: Text("save me"),
                  style: TextButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.70, 10), //,
                    elevation: 5,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ))
            ],
          ),
        )),
      ),
    );
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Welcome..",
              style:
                  GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.waving_hand_rounded,
                color: Color.fromRGBO(250, 190, 53, 1)),
          ],
        ),
      ),
      // body: UserForm(),
      body: Stack(
        children: [
          UserForm(),
        ],
      ),
    );
  }
}
