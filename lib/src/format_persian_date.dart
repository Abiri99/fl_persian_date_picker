import 'package:shamsi_date/shamsi_date.dart';

String formatPersianDate(Date d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
}
