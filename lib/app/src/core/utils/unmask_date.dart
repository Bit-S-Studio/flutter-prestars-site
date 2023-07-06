import 'package:brasil_fields/brasil_fields.dart';

class UnmaskDate {
  static String call({required String date, required String time}) {
    if (date.contains('/')) {
      final day = date.split('/')[0];
      final month = date.split('/')[1];
      final year = date.split('/')[2];

      return '$year-$month-${day}T$time:00.000-03:00';
    } else {
      return date;
    }
  }
}

extension DateToTimestamp on String {
  String get toTimestamp {
    final date = this;
    if (date.contains('/')) {
      final day = date.split('/')[0];
      final month = date.split('/')[1];
      final year = date.split('/')[2];
      return '$year-$month-${day}T00:00:00.000-03:00';
    } else {
      return date;
    }
  }
}

extension MaskDate on String {
  String get toDate {
    final date = this;
    DateTime dateTime;
    if (date.isEmpty) {
      dateTime = DateTime(1940, 1, 1);
    } else {
      dateTime = DateTime.parse(date);
    }
    return UtilData.obterDataDDMMAAAA(dateTime);
  }
}
