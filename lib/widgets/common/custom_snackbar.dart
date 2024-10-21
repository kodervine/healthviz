import 'package:flutter/material.dart';

enum CustomSnackbarVariant { error, success, neutral }

class CustomSnackBar {
  static Color getColor(CustomSnackbarVariant variant) {
    switch (variant) {
      case CustomSnackbarVariant.error:
        return const Color.fromARGB(255, 208, 71, 59); // Red for error
      case CustomSnackbarVariant.success:
        return const Color.fromARGB(255, 76, 175, 80); // Green for success
      case CustomSnackbarVariant.neutral:
      default:
        return const Color.fromARGB(255, 158, 158, 158); // Grey for neutral
    }
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    CustomSnackbarVariant variant = CustomSnackbarVariant.neutral,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    Color color = getColor(variant);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: behavior,
        margin: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * 0.83,
          left: 10,
          right: 10,
        ),
      ),
    );
  }
}
