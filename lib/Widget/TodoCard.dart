import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tablet/Database/models/TodoType.dart';
import 'package:tablet/Widget/DateTime.dart';
import 'package:tablet/Widget/IconGenerators.dart';

import '../Database/models/TodoType.dart';
import '../Database/models/todo.dart';

class TodoCard extends StatefulWidget {
  TodoCard({required this.todo});
  Todo todo;
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  List<Color> colors = [
    Color.fromRGBO(109, 49, 237, 1),
    Color.fromRGBO(255, 211, 23, 1),
    Color.fromRGBO(21, 171, 255, 1),
    Color.fromRGBO(249, 98, 62, 1),
    Color.fromRGBO(222, 59, 64, 1),
    Color.fromRGBO(255, 86, 165, 1)
  ];

  Widget build(context) {
    return Card(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    decoration: BoxDecoration(
                        color:
                            colors.elementAt(Random().nextInt(colors.length)),
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 45,
                    child: IconGenerators()
                        .GetTodoIcon(widget.todo.todoType, Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.todo.todoType.name,
                    style: GoogleFonts.lexend(fontSize: 20),
                  ),
                  Text(DateTimeGetter().parseWeekDay(DateTime.now().weekday))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
