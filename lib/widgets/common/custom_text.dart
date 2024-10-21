import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    this.color = Colors.black87,
    required this.text,
    this.textSize = 16,
    this.alignment = TextAlign.left,
    this.textWeight = FontWeight.w400,
    this.textOverflow,
    this.maxLines,
    super.key,
  });

  final Color color;
  final String text;
  final double textSize;
  final TextAlign alignment;
  final FontWeight textWeight;
  final TextOverflow? textOverflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: textSize, fontWeight: textWeight),
      textAlign: alignment,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
