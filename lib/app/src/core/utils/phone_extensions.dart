extension PhoneFilter on String {
  String get phoneFilter {
    RegExp regExp = RegExp('[^A-Za-z0-9]');
    final phone = this;
    final newPhone = phone.replaceAll(regExp, '');
    return newPhone;
  }
}

extension ExtractPhone on String {
  String get extractPhone {
    final phone = this;
    if (phone.length >= 9) {
      return phone.substring(phone.length - 9);
    } else {
      return phone;
    }
  }
}
