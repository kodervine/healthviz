import 'package:healthviz/widgets/common/custom_text.dart';
import 'package:healthviz/widgets/forms/custom_input.dart';
import 'package:flutter/material.dart';

class CustomTriggerButton extends StatelessWidget {
  final String? label;
  final double? labelFontSize;
  final Color? labelTextColor;
  final FontWeight? labelFontWeight;
  final String value;
  final Icon? icon;
  final VoidCallback onPressed;
  final InputVariant variant;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomTriggerButton({
    super.key,
    required this.value,
    this.icon,
    this.label,
    this.labelFontSize,
    this.labelFontWeight,
    this.labelTextColor,
    required this.onPressed,
    this.variant = InputVariant.outline,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isOutline = variant == InputVariant.outline;

    return SizedBox(
      width: double.infinity, // Ensure it takes full width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            CustomText(
              text: label!,
              textSize: labelFontSize ?? 14,
              color: labelTextColor ?? Colors.black,
              textWeight: labelFontWeight ?? FontWeight.normal,
            ),
          const SizedBox(height: 6),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: isOutline
                  ? Colors.white
                  : const Color.fromRGBO(252, 252, 252, 1),
              foregroundColor:
                  textColor ?? (isOutline ? Colors.white : Colors.blue),
              side: BorderSide(
                  color: borderColor ??
                      (isOutline
                          ? Colors.grey
                          : const Color.fromRGBO(217, 217, 217, 1)),
                  width: 1.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: isOutline ? 4.0 : 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if (icon != null) ...[
                        icon!,
                        const SizedBox(width: 8.0),
                      ],
                      CustomText(
                        text: value,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: textColor ?? Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
