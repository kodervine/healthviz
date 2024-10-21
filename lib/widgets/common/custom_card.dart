import 'package:flutter/material.dart';
import 'package:healthviz/widgets/common/custom_text.dart';
import 'package:healthviz/widgets/forms/custom_button.dart';

enum CustomCardVariant { delete, view, radio, checkbox }

class CustomCard extends StatefulWidget {
  final CustomCardVariant customCardVariant;
  final dynamic item;
  final dynamic selectedCardItem;
  final List<dynamic>? selectedCardItems; // saved Custom in bulk are stored
  final void Function(dynamic)? onCardItemSelection;
  final void Function(dynamic)? onCardItemsSelection;

  const CustomCard(
      {super.key,
      required this.customCardVariant,
      this.item,
      this.onCardItemSelection,
      this.onCardItemsSelection,
      this.selectedCardItem,
      this.selectedCardItems});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isCheckboxSelected(dynamic item) {
    return widget.selectedCardItems?.contains(item) ?? false;
  }

  void _toggleCheckboxSelection() {
    if (widget.onCardItemsSelection != null) {
      widget.onCardItemsSelection!(widget.item);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isRadioSelected = widget.selectedCardItem?.ok == widget.item.ok;
    bool isCheckboxSelected = _isCheckboxSelected(widget.item);
    bool isCustomCardSelectable =
        widget.customCardVariant == CustomCardVariant.radio ||
            widget.customCardVariant == CustomCardVariant.checkbox;

    return GestureDetector(
      onTap: () => {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isRadioSelected || isCheckboxSelected
                ? const Color(0XFF63A5C8)
                : const Color(0XFF95C2D9),
            width: 0.2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0DE9E9E9),
              spreadRadius: 0,
              blurRadius: 40,
              offset: Offset(-4, 2),
            ),
            BoxShadow(
              color: Color(0x1AE9E9E9),
              spreadRadius: 0,
              blurRadius: 40,
              offset: Offset(4, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: 12.0,
              right: 12,
              bottom: 12,
              left: isCustomCardSelectable ? 0 : 12.0),
          child: Row(
            children: [
              if (widget.customCardVariant == CustomCardVariant.radio)
                Transform.scale(
                  scale: 1,
                  child: Radio<String>(
                    value: widget.item.ok ?? "", // Ensure non-null value
                    groupValue: widget.selectedCardItem.ok ??
                        "", // Ensure non-null comparison
                    onChanged: (String? value) {
                      setState(() {
                        widget.onCardItemSelection?.call(widget.item);
                      });
                    },
                    activeColor: const Color(0XFF0870A7),
                  ),
                ),
              if (widget.customCardVariant == CustomCardVariant.checkbox)
                Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    value: isCheckboxSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        _toggleCheckboxSelection();
                      });
                    },
                    activeColor: const Color(0XFF0870A7),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Pain Level",
                          textSize: 16,
                          color: Colors.black,
                          textWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            // Display Day and Month Separately
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.00, horizontal: 20.00),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0XFF95C2D9).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: const Column(
                                children: [
                                  CustomText(
                                    text: "Date",
                                    color: Colors.black,
                                    textSize: 12,
                                  ),
                                  CustomText(
                                    text: "getDayFromDate",
                                    color: Colors.black,
                                    textSize: 30,
                                    textWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const CustomText(
                              text: "time with",
                              textSize: 16,
                              textWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(width: 16.0),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: 'Health ',
                                    // textSize: 14,
                                    color: Color(0XFF595959),
                                  ),
                                  Flexible(
                                    child: CustomText(
                                      text: '2',
                                      // size: 14,
                                      color: Color(0XFF075F8E),
                                      textOverflow: TextOverflow.clip,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      text: "More Details",
                      handlePress: () {
                        // navigate to screen with details about the pain
                      },
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      borderRadius: 8,
                      textWeight: FontWeight.w700,
                      textSize: 12,
                      bgColor: const Color(0XFFE6F1F6),
                      color: const Color(0XFF075F8E),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
