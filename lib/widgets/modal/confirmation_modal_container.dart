import 'package:flutter/material.dart';
import 'package:healthviz/widgets/common/custom_heading.dart';
import 'package:healthviz/widgets/common/custom_text.dart';
import 'package:healthviz/widgets/forms/custom_button.dart';

class ConfirmationModalWidget extends StatelessWidget {
  final String heading;
  final String description;
  final VoidCallback onPress;
  final String buttonText;
  final String loadingText;
  final bool isLoading;
  final Widget? imageWidget;

  const ConfirmationModalWidget({
    super.key,
    required this.heading,
    required this.description,
    required this.onPress,
    required this.buttonText,
    required this.loadingText,
    this.isLoading = false,
    this.imageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          imageWidget ??
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
          const SizedBox(height: 20.0),
          CustomHeading(text: heading),
          const SizedBox(height: 5.0),
          CustomText(text: description),
          const SizedBox(height: 20.0),
          CustomButton(
            text: isLoading ? loadingText : buttonText,
            handlePress: onPress,
            textSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            loading: isLoading,
          ),
        ],
      ),
    );
  }
}
