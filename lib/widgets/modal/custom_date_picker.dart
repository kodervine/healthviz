import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDatePicker extends ConsumerStatefulWidget {
  const CustomDatePicker(
      {super.key,
      required this.onDateChanged,
      this.currentDate,
      this.isMinDateNow = true});
  final void Function(DateTime value) onDateChanged;
  final String? currentDate;
  final bool? isMinDateNow;

  @override
  ConsumerState<CustomDatePicker> createState() {
    return _CustomDatePickerState();
  }
}

class _CustomDatePickerState extends ConsumerState<CustomDatePicker> {
  final now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: widget.currentDate == "Select Date"
          ? now
          : DateTime.parse(widget.currentDate!),
      firstDate: widget.isMinDateNow! ? now : DateTime(2000, 1, 1),
      lastDate: DateTime(now.year + 1, now.month, now.day),
      onDateChanged: widget.onDateChanged,
      selectableDayPredicate: (day) {
        return true;
      },
    );
  }
}
