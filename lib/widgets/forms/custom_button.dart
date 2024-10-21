import 'package:flutter/material.dart';

enum IconPosition {
  left,
  right,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.handlePress,
    this.loading = false,
    this.bgColor = const Color.fromARGB(255, 108, 33, 129),
    this.disabledBgColor = const Color.fromRGBO(8, 112, 167, 0.4),
    this.width = double.infinity,
    this.borderRadius = 5.42,
    this.color = Colors.white,
    this.textSize = 14,
    this.textWeight = FontWeight.w800,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    this.icon,
    this.iconPosition = IconPosition.left,
  });

  final String text;
  final double width;
  final double borderRadius;
  final Color color;
  final Color bgColor;
  final Color disabledBgColor;
  final double? textSize;
  final FontWeight textWeight;
  final bool loading;
  final EdgeInsets padding;
  final Icon? icon;
  final IconPosition iconPosition;
  final void Function()? handlePress;

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontSize: textSize,
            fontWeight: textWeight,
          ),
    );

    if (icon != null) {
      switch (iconPosition) {
        case IconPosition.left:
          buttonContent = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon!,
              const SizedBox(width: 8),
              buttonContent,
            ],
          );
          break;
        case IconPosition.right:
          buttonContent = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buttonContent,
              const SizedBox(width: 8),
              icon!,
            ],
          );
          break;
      }
    }
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: loading ? null : handlePress,
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBackgroundColor: disabledBgColor,
          padding: padding,
        ),
        child: buttonContent,
      ),
    );
  }
}
