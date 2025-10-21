import 'package:intl/intl.dart';

class StringUtils {
  static String getInitials(String? name) {
    if (name == null) return "?";

    String cleaned = name.trim();
    if (cleaned.isEmpty) return "?";

    List<String> parts =
        cleaned.split(RegExp(r"\s+")).where((p) => p.isNotEmpty).toList();

    if (parts.isEmpty) return "?";

    if (parts.length >= 2) {
      return (parts.first[0] + parts.last[0]).toUpperCase();
    }

    String word = parts.first;

    if (word.length >= 2) {
      return (word[0] + word[1]).toUpperCase();
    }

    if (word.isNotEmpty) {
      return word[0].toUpperCase();
    }

    return "";
  }

  static String formatToCommas(String value) {
    final cleaned = value.replaceAll(',', '');

    final intNumber = int.tryParse(cleaned);
    if (intNumber != null) {
      return NumberFormat.decimalPattern().format(intNumber);
    }

    final doubleNumber = double.tryParse(cleaned);
    if (doubleNumber != null) {
      return NumberFormat.decimalPattern().format(doubleNumber);
    }

    return value;
  }
}
