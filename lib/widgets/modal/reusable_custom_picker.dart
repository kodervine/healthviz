import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCustomPicker extends StatefulWidget {
  const ReusableCustomPicker({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.list,
    // required this.scrollController,
  });

  final int initialValue;
  final void Function(int values) onChanged;
  final List<String> list;

  @override
  State<ReusableCustomPicker> createState() => _ReusableCustomPickerState();
}

class _ReusableCustomPickerState extends State<ReusableCustomPicker> {
  late int selectedItemIndex;
  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    selectedItemIndex = widget.initialValue;
    scrollController = FixedExtentScrollController(
      initialItem: selectedItemIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPicker(
        backgroundColor: Colors.white,
        itemExtent: 50,
        magnification: 1.125,
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedItemIndex = index;
          });
          widget.onChanged(index);
        },
        looping: true,
        selectionOverlay: const SizedBox.shrink(),
        scrollController: scrollController,
        children: List.generate(widget.list.length, (int index) {
          final bool isSelected = index == selectedItemIndex;
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 42),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSelected
                    ? const Color.fromRGBO(230, 241, 246,
                        1.0) // Opaque background for selected item
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  widget.list[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected
                        ? const Color.fromRGBO(3, 1, 26, 1)
                        : const Color.fromRGBO(
                            191, 191, 191, 1,
                            // fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
