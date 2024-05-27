import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'package:tablet/screens/Alert.dart';

class DateTimeGetter {
  String parseMonth(int month) {
    String Month = month == 1
        ? "JAN"
        : month == 2
            ? "FEB"
            : month == 3
                ? "MAR"
                : month == 4
                    ? "APR"
                    : month == 5
                        ? "MAY"
                        : month == 6
                            ? "JUN"
                            : month == 7
                                ? "JUL"
                                : month == 8
                                    ? "AUG"
                                    : month == 9
                                        ? "SEP"
                                        : month == 10
                                            ? "OCT"
                                            : month == 11
                                                ? "NOV"
                                                : month == 12
                                                    ? "DEC"
                                                    : "...";
    return Month;
  }

  String parseWeekDay(int weekDay) {
    String weekday = weekDay == 1
        ? "MON"
        : weekDay == 2
            ? "TUE"
            : weekDay == 3
                ? "WED"
                : weekDay == 4
                    ? "THU"
                    : weekDay == 5
                        ? "FRI"
                        : weekDay == 6
                            ? "SAT"
                            : weekDay == 7
                                ? "SUN"
                                : "...";
    return weekday;
  }

  Widget Today() {
    var day = DateTime.now().day.toString();
    var month = parseMonth(DateTime.now().month);
    var weekday = parseWeekDay(DateTime.now().weekday);
    var date = weekday + " " + day + " " + month;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            // onLongPress: () {
            //   Get.changeTheme(
            //       Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            // },
            child: Icon(
              size: 20,
              Get.isDarkMode
                  ? Icons.nightlight_round_rounded
                  : Icons.wb_sunny_rounded,
              color: Color.fromRGBO(86, 93, 109, 1),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            date,
            style: GoogleFonts.manrope(color: Color.fromRGBO(86, 93, 109, 1)),
          )
        ],
      ),
    );
  }
}

class GetTimer extends StatefulWidget {
  GetTimer({required this.duration});
  final Duration duration;

  @override
  State<GetTimer> createState() => _GetTimerState();
}

class _GetTimerState extends State<GetTimer> {
  late Timer _countdownTimer;
  late Duration _myDuration;

  @override
  void initState() {
    super.initState();
    _myDuration = widget.duration;
    _startTimer();
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_myDuration.inSeconds > 0) {
        setState(() {
          _myDuration = _myDuration - Duration(seconds: 1);
        });
      } else {
        _countdownTimer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(duration.inHours.remainder(24));
    final minutes = strDigits(duration.inMinutes.remainder(60));
    final seconds = strDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_myDuration),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ShowDigitalClock extends StatelessWidget {
  Widget build(context) {
    return Container(
      height: 50,
      //width: MediaQuery.of(context).size.width * 0.30,
      child: DigitalClock(
        digitAnimationStyle: Curves.easeIn,
        colon: Text(
          ":",
          style: GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        hourMinuteDigitTextStyle:
            GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold),
        is24HourTimeFormat: false,
      ),
    );
  }
}
