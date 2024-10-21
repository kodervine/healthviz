import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.textSize = 20,
    this.textWeight = FontWeight.w700,
    this.textOverflow,
    this.maxLines,
  });

  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;
  final TextOverflow? textOverflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.leagueSpartan(
        color: textColor,
        fontSize: textSize,
        fontWeight: textWeight,
      ),
    );
  }
}
