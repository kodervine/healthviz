import 'package:intl/intl.dart';

String formatDateDDMMYY(dynamic date) {
  if (date is int) {
    date = DateTime.fromMillisecondsSinceEpoch(date);
  }

  return DateFormat('dd-MM-yyyy').format(date);
}

String getDayFromDate(dynamic date) {
  try {
    final dateTime =
        DateFormat('yyyy-MM-dd').parse(date); // format is in 2024-09-03
    return DateFormat('dd').format(dateTime); // returns, 15
  } catch (e) {
    return 'Invalid';
  }
}

String getMonthFromDate(dynamic date) {
  try {
    final dateTime =
        DateFormat('yyyy-MM-dd').parse(date); // format is in 2024-09-03
    return DateFormat('MMM').format(dateTime); // returns, e.g., Aug
  } catch (e) {
    return 'Invalid';
  }
}

String getTimeWithAmPm(String timeString) {
  try {
    final time = DateFormat('HH:mm').parse(timeString);
    return DateFormat('hh:mm a').format(time); // returns e.g., 11:20 AM
  } catch (e) {
    return 'Invalid';
  }
}

String getTimeWithoutAmPmFromAmPm(String timeString) {
  try {
    final time = DateFormat('hh:mm a').parse(timeString); // Parses 04:30 AM
    return DateFormat('HH:mm').format(time); // Converts to 24-hour format
  } catch (e) {
    return 'Invalid';
  }
}

String getMonthDayWithSuffix(dynamic date) {
  try {
    final dateTime =
        DateFormat('yyyy-MM-dd').parse(date); // format is in 2024-09-03

    return DateFormat('MMMM, dd').format(dateTime); // returns, e.g., Aug 3
  } catch (e) {
    return 'Invalid';
  }
}

String getDayDateFullMonthYear(String date) {
  try {
    final dateTime =
        DateFormat('yyyy-MM-dd').parse(date); // format is in 2024-09-03

    return DateFormat('EEEE d MMMM yyyy')
        .format(dateTime); // returns e.g Monday 1 January 2024
  } catch (e) {
    return 'Invalid date';
  }
}

double timeStringToHours(String timeString) {
  final parts = timeString.split(RegExp(r'[:.]'));
  if (parts.length != 2) {
    return 0.0;
  }
  final hours = int.tryParse(parts[0]) ?? 0;
  final minutes = int.tryParse(parts[1]) ?? 0;
  return hours + minutes / 60;
}

String getMonthDayWithSuffixFromList(List<dynamic> dateArray) {
  // input [10,3,2023]
  if (dateArray.length != 3) {
    throw ArgumentError(
        'Date array should contain exactly 3 elements (Day, Month, Year).');
  }

  const List<String> months = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  int day = dateArray[0];
  int month = dateArray[1];
  String suffix;

  // Determine the suffix for the day (st, nd, rd, th)
  if (day >= 11 && day <= 13) {
    suffix = 'th';
  } else {
    switch (day % 10) {
      case 1:
        suffix = 'st';
        break;
      case 2:
        suffix = 'nd';
        break;
      case 3:
        suffix = 'rd';
        break;
      default:
        suffix = 'th';
    }
  }

  String monthName = months[month];

  return '$monthName, $day$suffix'; // output Jul, 4th
}

String getTimeWithAmPmFromList(List<dynamic> timeArray) {
  // input [19,10]
  if (timeArray.length != 2) {
    throw ArgumentError(
        'Time array should contain exactly 2 elements (Hour and Minute).');
  }

  int hour = timeArray[0];
  int minute = timeArray[1];
  String period = hour >= 12 ? 'pm' : 'am';

  int formattedHour = hour % 12;
  if (formattedHour == 0) {
    formattedHour = 12;
  }

  String minuteStr = minute.toString().padLeft(2, '0');

  return '$formattedHour:$minuteStr $period'; // output 10:00am
}
