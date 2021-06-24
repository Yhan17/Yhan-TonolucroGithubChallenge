import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(date);
}