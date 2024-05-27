import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tablet/Database/Hive.dart';
import 'package:tablet/Database/models/Notify.dart';
import 'package:tablet/Database/models/NotifyType.dart';
import 'package:tablet/Database/models/TodoType.dart';
import 'package:tablet/Widget/IconGenerators.dart';
import 'package:tablet/screens/Animations.dart';

import '../Database/models/todo.dart';
import '../Notifications/NotificationPushController.dart';
import '../screens/Home.dart';

class GetTask extends StatefulWidget {
  State<GetTask> createState() => _GettaskState();
}

class _GettaskState extends State<GetTask> with SingleTickerProviderStateMixin {
  TodoType todotype = TodoType.Breakfast;
  NotifyType notifyType = NotifyType.Slight;
  TimeOfDay notifytime = TimeOfDay.now();
  int noOfDays = 1;
  String? description;
  DateTime alaramTime = DateTime.now();
  final key = GlobalKey<FormState>();

  Future<void> getTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      notifytime = time!;
    });
  }

  saveTodo() async {
    final validator = key.currentState!.validate();
    if (validator) {
      key.currentState!.save();
      Todo newTodo = Todo(
          notify: Notify(
              noOfDays: noOfDays, time: [notifytime], notyfyType: notifyType),
          todoType: todotype,
          description: description);
      HiveData().addTodo(newTodo);
      await NotificationPushController().scheduleNotification(
          id: 1,
          title: todotype.name,
          body:
              "IT'S TIME FOR ${todotype.name} ${description != null ? description : null}",
          scheduledTime: alaramTime,
          days: noOfDays,
          time: notifytime);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Animations(
                    animationURL: "assets/animations/done.json",
                    getOff: "/home",
                  )));
      Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          icon: Icon(Icons.thumb_up_alt_rounded),
          titleText: Text("Sucess"),
          messageText: Text(
              "Your ${todotype.name} Succesfully Notified to ${alaramTime.hour}:${alaramTime.minute}")));
    }
  }

  Widget build(context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                      focusColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                      value: todotype,
                      items: TodoType.values.map((e) {
                        Icon icon =
                            IconGenerators().GetTodoIcon(e, Colors.black);
                        return DropdownMenuItem(
                          key: UniqueKey(),
                          value: e,
                          child: Row(children: [
                            icon,
                            SizedBox(
                              width: 10,
                            ),
                            Text(e.name)
                          ]),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          todotype = value!;
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd MMM, yyyy',
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      selectableDayPredicate: (date) {
                        // Disable weekend days to select from the calendar
                        if (date.weekday == 6 || date.weekday == 7) {
                          return false;
                        }

                        return true;
                      },
                      onChanged: (val) {
                        setState(() {
                          alaramTime = DateTime.parse(val);
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(20),
                      value: notifyType,
                      items: NotifyType.values.map((e) {
                        Icon icon = IconGenerators().GetNotifyIcon(e);
                        return DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                icon,
                                SizedBox(
                                  width: 20,
                                ),
                                Text(e.name)
                              ],
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          notifyType = value!;
                        });
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                    child: Form(
                  key: key,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (value) {
                          setState(() {
                            noOfDays = int.parse(value!);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Enter no of days";
                          if (int.tryParse(value) == null)
                            return "Enter a valid no of days";
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(243, 244, 246, 1),
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                            isDense: true,
                            hintText: "  Enter no of days",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                        // validator: (value) {
                        //   if (value == null || value.isEmpty)
                        //     return "Type your age";
                        //   if (int.tryParse(value) == null)
                        //     return "Enter a valid age";
                        //   return null;
                        // },
                        //keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(243, 244, 246, 1),
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                            isDense: true,
                            hintText: "Enter any thing",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                )),
              ),
              TextButton(onPressed: saveTodo, child: Text("save"))
            ],
          ),
        ),
      ),
    );
  }
}
