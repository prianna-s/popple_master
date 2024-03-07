import 'package:intl/intl.dart';

extension DateConvert on String {

  String toSplitDate() {
    final oldFormat =  DateFormat('yyyy-MM-dd');
    final newDate =  DateFormat('dd MMM');
    DateTime dateTime=oldFormat.parse(this);
    String date=newDate.format(dateTime);
    return date.replaceAll(" ", "\n");
  }
}