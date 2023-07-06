extension ToOrdinal on int {
  String get toOrdinal {
    if (this < 0) throw Exception('Invalid Number');

    switch (this % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
