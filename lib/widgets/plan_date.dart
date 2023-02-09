import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PlanDate extends StatelessWidget {
  final Function chooseDate;
  final DateTime defaultDate;
  final Function() previousDate;
  final Function() nextDate;

  PlanDate(this.chooseDate, this.defaultDate, this.previousDate,this.nextDate);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: previousDate,
          icon: Icon(
            Icons.arrow_left,
            size: 35,
          ),
        ),
        TextButton(
            onPressed: () {
              chooseDate(context);
            },
            child: RichText(
                text: TextSpan(
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              children: [
                TextSpan(
                    text: "${DateFormat.EEEE().format(defaultDate)}, ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${DateFormat("d MMM").format(defaultDate)}"),
              ],
            ))),
        IconButton(
          onPressed: nextDate,
          icon: Icon(
            Icons.arrow_right,
            size: 35,
          ),
        ),
      ],
    );
  }
}
