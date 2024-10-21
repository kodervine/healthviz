import 'package:intl/intl.dart';

String capitalizeFirstWord(String text) {
  if (text.isEmpty) return text;
  List<String> words = text.split(' ');
  words[0] = words[0].substring(0, 1).toUpperCase() + words[0].substring(1);
  return words.join(' ');
}

String formatNumbersInThousandsWithComma(dynamic amount) {
  if (amount is String) {
    amount = double.tryParse(amount) ?? 0.0;
  }

  final formatter = NumberFormat('#,##0.00');

  if (amount is int || amount is double) {
    return formatter.format(amount);
  }

  return '0.00';
}
