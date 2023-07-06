import 'dart:async';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import '../../../../../../prestars_exports.dart';

class ShowSuccessDialog {
  static void call(BuildContext context,
      {required String text, VoidCallback? then}) async {
    Asuka.showDialog(builder: (context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
        if (then != null) {
          then();
          return;
        }
      });
      return UiSuccessDialog(
        text: text,
      );
    });
  }
}
