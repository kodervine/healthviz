import 'package:flutter/material.dart';
import 'package:healthviz/widgets/common/custom_text.dart';

class NothingFound extends StatelessWidget {
  const NothingFound({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/person-empty-drawers.png",
            fit: BoxFit.cover,
            height: 250,
          ),
          CustomText(text: value)
        ],
      ),
    );
  }
}
