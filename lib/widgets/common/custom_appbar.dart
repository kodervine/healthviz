import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.centerTitle = true,
    this.backgroundColor = Colors.white,
    this.surfaceTintColor = Colors.white,
    this.elevation = 0,
    this.actions,
    this.onBackButtonPressed,
  });

  final Widget? leading;
  final Widget title;
  final bool centerTitle;
  final Color backgroundColor;
  final Color surfaceTintColor;
  final double elevation;
  final List<Widget>? actions;
  final void Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: AppBar(
        leading: leading ??
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed:
                  onBackButtonPressed ?? () => Navigator.of(context).pop(),
            ),
        title: title,
        // centerTitle: centerTitle,
        backgroundColor: backgroundColor,
        toolbarHeight: 120.0,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
