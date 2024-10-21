import 'package:flutter/material.dart';
import 'package:healthviz/widgets/forms/custom_input.dart';

class CustomDropdown extends StatelessWidget {
  final String? label;
  final String hintText;
  final InputVariant variant;
  final TextEditingController? controller;
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
  final double? fontSize;
  final EdgeInsetsGeometry? contentPadding;
  final Function(dynamic)? onSelected;
  final Icon? leadingIcon;
  final bool? enableFilter;
  final bool? enableSearch;
  final Color? menuSurfaceTintColor;
  final Color? menuBackgroundColor;
  final List<DropdownMenuEntry> dropdownMenuEntries;
  final dynamic initialSelection;

  const CustomDropdown({
    super.key,
    this.label,
    this.controller,
    this.errorColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.fillColor,
    this.labelColor,
    this.errorStyle,
    this.borderWidth,
    this.focusedBorderWidth,
    this.borderRadius,
    this.fontSize,
    this.contentPadding,
    this.onSelected,
    this.leadingIcon,
    this.labelFontSize,
    this.labelFontWeight,
    this.enableSearch = true,
    this.enableFilter = false,
    this.variant = InputVariant.outline,
    this.menuSurfaceTintColor = const Color.fromRGBO(255, 255, 255, 1),
    this.menuBackgroundColor = const Color.fromRGBO(255, 255, 255, 1),
    this.initialSelection,
    required this.hintText,
    required this.dropdownMenuEntries,
  });

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(68, 68, 68, 1),
      ),
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      border: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: focusedBorderColor ?? const Color.fromARGB(255, 121, 0, 88),
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
          color: errorColor ?? const Color.fromARGB(255, 255, 46, 46),
          width: focusedBorderWidth ?? 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: errorColor ?? const Color.fromARGB(255, 255, 46, 46),
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
    );
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
              fontSize: labelFontSize ?? 16.0,
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
          child: DropdownMenu(
            controller: controller,
            hintText: hintText,
            expandedInsets: const EdgeInsets.symmetric(
                vertical: 6.0), // makes dropdown take full width
            enableFilter: enableFilter!,
            enableSearch: enableSearch!,
            requestFocusOnTap: true,
            leadingIcon: leadingIcon,
            inputDecorationTheme: _inputDecorationTheme(),
            onSelected: onSelected,
            dropdownMenuEntries: dropdownMenuEntries,
            initialSelection: initialSelection,
            menuStyle: MenuStyle(
              surfaceTintColor: MaterialStateProperty.resolveWith((states) {
                return menuSurfaceTintColor;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return menuBackgroundColor;
              }),
            ),
          ),
        ),
      ],
    );
  }
}
