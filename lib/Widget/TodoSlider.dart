import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tablet/Data/Pills.dart';
import 'package:tablet/Database/Hive.dart';
import 'package:tablet/Widget/Pillcard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tablet/Widget/getTask.dart';

import '../Database/models/Notify.dart';
import '../Database/models/todo.dart';

class TodoSlider extends StatefulWidget {
  State<TodoSlider> createState() => _TodoSliderState();
}

class _TodoSliderState extends State<TodoSlider> {
  List<Todo> _todoList = [];
  void setList() async {
    var hiveList = await HiveData().getTodoList();
    setState(() {
      _todoList = hiveList;
    });
  }

  void initState() {
    super.initState();
    setList();
  }

  Widget build(context) {
    setList();
    final size = MediaQuery.of(context).size;
    if (_todoList.length == 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Card(
            child: Container(
              height: size.height * 0.18,
              width: size.width * 0.35,
              child: Center(
                child: IconButton(
                    onPressed: () async {
                      showBottomSheet(
                        context: context,
                        builder: (context) => GetTask(),
                      );
                      setState(() {});
                    },
                    icon: Icon(Icons.add)),
              ),
            ),
          ),
        ),
      );
    }
    return CarouselSlider(
        items: _todoList.map((e) {
          if (TimeOfDay.now().hour - e.notify.time[0].hour > 0 ||
              TimeOfDay.now().minute - e.notify.time[0].minute > 0) {
            return PillCard(
                todo: e,
                remainingTime: Duration(
                    hours: TimeOfDay.now().hour - e.notify.time[0].hour,
                    minutes: TimeOfDay.now().minute - e.notify.time[0].minute));
          }
          return PillCard(todo: e, remainingTime: Duration(days: 0));
        }).toList(),
        options: CarouselOptions(
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlay: true,
        ));
  }
}
