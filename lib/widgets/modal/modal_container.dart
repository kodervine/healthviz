import 'package:flutter/material.dart';
import 'package:healthviz/widgets/common/custom_heading.dart';
import 'package:healthviz/widgets/common/custom_text.dart';

class ModalContainer extends StatelessWidget {
  const ModalContainer(
      {super.key,
      required this.headingText,
      required this.bodyText,
      required this.child});

  final String headingText;
  final String bodyText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 8, 15, 35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHeading(
                    text: headingText,
                    textSize: 13,
                    textWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(240, 247, 250, 1)),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: CustomText(
                  text: bodyText,
                  alignment: TextAlign.left,
                  textSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              child
            ],
          ),
        ),
      ),
    );
  }
}
