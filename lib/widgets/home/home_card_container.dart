import 'package:flutter/material.dart';

class HomeCardContainer extends StatelessWidget {
  const HomeCardContainer({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: const Color.fromARGB(255, 249, 229, 255),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0DE9E9E9),
            spreadRadius: 0,
            blurRadius: 40,
            offset: Offset(-4, 2),
          ),
          BoxShadow(
            color: Color(0x1AE9E9E9),
            spreadRadius: 0,
            blurRadius: 40,
            offset: Offset(4, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: childWidget,
      ),
    );
  }
}
