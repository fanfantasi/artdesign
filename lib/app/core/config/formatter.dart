import 'package:intl/intl.dart';

class Formatter {
  static String number(int num) {
    final formatter = NumberFormat("#,###");
    return formatter.format(num);
  }

  static String dateformat(String date) {
    final formatter = DateFormat('d MMM y').format(DateTime.parse(date));
    return formatter;
  }
}
