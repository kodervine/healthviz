import 'package:flutter/material.dart';
import 'package:healthviz/widgets/common/custom_text.dart';

enum HomeCardLinkVariant { spaced, compact }

class HomeCardLink extends StatelessWidget {
  final VoidCallback onPress;
  final String onPressText;
  final HomeCardLinkVariant variant;
  final double? textSize;

  const HomeCardLink({
    super.key,
    required this.onPress,
    required this.onPressText,
    this.textSize,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: variant == HomeCardLinkVariant.spaced
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        CustomText(
          text: onPressText,
          textSize: textSize ?? 12,
          color: const Color(0XFF262626),
        ),
        const SizedBox(width: 8.0),
        GestureDetector(
          onTap: onPress,
          child: const Icon(
            Icons.chevron_right,
            size: 16,
          ),
        ),
      ],
    );
  }
}
