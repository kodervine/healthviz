import 'package:flutter/material.dart';

enum InputVariant {
  filled,
  outline,
}

class CustomInput extends StatelessWidget {
  final String? label;
  final String hint;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int minLines;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final Color? errorColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? fillColor;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final TextStyle? errorStyle;
  final double? borderWidth;
  final double? focusedBorderWidth;
  final BorderRadius? borderRadius;
  final Color? hintTextColor;
  final double? fontSize;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isEnabled;
  final FontWeight? fontWeight;
  final String? errorText;
  final InputVariant variant;
  final String? initialValue;
  final FocusNode? focusNode;

  const CustomInput({
    super.key,
    this.label,
    this.labelFontSize,
    this.labelFontWeight,
    required this.hint,
    this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines = 1,
    this.maxLines = 1,
    this.fontSize = 14,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.errorColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.fillColor,
    this.labelColor,
    this.errorStyle,
    this.borderWidth,
    this.focusedBorderWidth,
    this.borderRadius,
    this.hintTextColor,
    this.contentPadding,
    this.isEnabled = true,
    this.fontWeight = FontWeight.w400,
    this.variant = InputVariant.outline,
    this.initialValue,
    this.focusNode,
    this.errorText,
  });

  InputDecoration _inputDecoration() {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 12,
            color: hintTextColor ??
                (variant == InputVariant.outline
                    ? const Color.fromRGBO(102, 112, 133, 1)
                    : const Color.fromARGB(255, 197, 197, 197)),
            fontWeight: fontWeight),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: focusedBorderColor ?? const Color(0xFF0870A7),
            width: focusedBorderWidth ?? 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: enabledBorderColor ??
                (variant == InputVariant.outline
                    ? Colors.grey
                    : const Color.fromRGBO(217, 217, 217, 1)),
            width: borderWidth ?? 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: errorColor ?? const Color(0xFFD97706),
            width: focusedBorderWidth ?? 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: errorColor ?? const Color(0xFFD97706),
            width: focusedBorderWidth ?? 2.0,
          ),
        ),
        filled: true,
        fillColor: fillColor ??
            (variant == InputVariant.outline
                ? Colors.white
                : const Color.fromRGBO(252, 252, 252, 1)),
        errorStyle: TextStyle(
          color: errorColor,
        ),
        errorText: errorText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              fontSize: labelFontSize ?? 14.0,
              fontWeight: labelFontWeight ??
                  (variant == InputVariant.outline
                      ? FontWeight.w700
                      : FontWeight.normal),
              color: labelColor ??
                  (variant == InputVariant.outline
                      ? Colors.grey[700]
                      : Colors.black),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
            controller: controller,
            enabled: isEnabled!,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            initialValue: initialValue,
            maxLines: maxLines,
            minLines: minLines,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            onSaved: onSaved,
            decoration: _inputDecoration(),
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }
}
