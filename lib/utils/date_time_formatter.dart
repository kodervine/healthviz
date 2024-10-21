import 'package:intl/intl.dart';

String formatDateArrayToReadableDate(List<int> dateParts) {
  final months = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  int year = dateParts[0];
  int month = dateParts[1];
  int day = dateParts[2];

  String monthName = months[month];

  return '$monthName $day, $year';
}

String convertTimestampInMillisecondsToDMYFormat(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString().substring(2);

  return '$day/$month/$year';
}

String convertPointTimeToAMPMTime(String timeString) {
  double time = double.parse(timeString);

  int hours = time.floor();
  int minutes = ((time - hours) * 60).round();

  String period = hours >= 12 ? "PM" : "AM";

  hours = hours % 12;
  if (hours == 0) hours = 12;

  String formattedMinutes = minutes.toString().padLeft(2, '0');

  return "$hours:$formattedMinutes$period";
}

String convertPointTimeTo24HourTime(String timeString) {
  double time = double.parse(timeString);

  int hours = time.floor();
  int minutes = ((time - hours) * 60).round();

  String formattedHours = hours.toString().padLeft(2, '0');
  String formattedMinutes = minutes.toString().padLeft(2, '0');

  return "$formattedHours:$formattedMinutes";
}

String changeDateOrder(String dateString) {
  DateTime parsedDate = DateTime.parse(dateString);
  return DateFormat('dd-MM-yyyy').format(parsedDate);
}
