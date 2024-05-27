import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tablet/Database/Hive.dart';

class ScoreCard extends StatefulWidget {
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 100;
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Container(
          width: size.width,
          height: size.height * 0.18,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "Health Score",
                      style: GoogleFonts.lexend(fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100)),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      height: 60,
                      width: 50,
                      child: Center(
                        child: Text(
                          HiveData().getHealthScore().toString(),
                          style: GoogleFonts.lexend(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Based on your overview health tracking\nyour score is $score and consider good..",
                    style: GoogleFonts.manrope(),
                  ),
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: null, child: Text("Tell me more  >")))
            ],
          ),
        ),
      ),
    );
  }
}
