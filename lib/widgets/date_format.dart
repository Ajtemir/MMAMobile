import 'package:intl/intl.dart';

String dateFormat(DateTime dateTime) {
  String time = DateFormat('dd.MM.yyyyг HH:mm').format(dateTime);
  return time;
}
