import 'package:intl/intl.dart';

class Util {
  static String ConvertDateTime(String time) {
    DateTime dateTime = DateTime.parse(time);
    return DateFormat('kk:mm - dd-MM-yyyy ').format(dateTime);
    ;
  }
}
