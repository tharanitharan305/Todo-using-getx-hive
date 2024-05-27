import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tablet/Database/Hive.dart';
import 'package:tablet/Widget/AnimationGenerator.dart';
import 'package:tablet/Widget/DateTime.dart';
import '../Database/models/todo.dart';
import 'IconGenerators.dart';

class PillCard extends StatelessWidget {
  PillCard({required this.todo, required this.remainingTime});
  Todo todo;
  Duration remainingTime;
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    bool isDone = remainingTime.inHours <= 0 &&
        remainingTime.inMinutes <= 0 &&
        remainingTime.inSeconds <= 0;
    return Card(
      child: Container(
        height: size.height * 0.18,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(142, 97, 241, 1)),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Lottie.asset(AnimationGenerators()
                    .GenerateAnimation(todoType: todo.todoType))),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        child: IconGenerators()
                            .GetTodoIcon(todo.todoType, Colors.white)),
                    GetTimer(duration: remainingTime),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      todo.todoType.name,
                      style:
                          GoogleFonts.lexend(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        todo.key.toString(),
                        style: GoogleFonts.lexend(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
