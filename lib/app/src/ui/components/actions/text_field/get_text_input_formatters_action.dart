import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class GetTextInputType {
  static TextInputType call(
    TextfieldType type,
  ) {
    switch (type) {
      case TextfieldType.text:
        return TextInputType.text;

      case TextfieldType.email:
        return TextInputType.emailAddress;

      case TextfieldType.password:
        return TextInputType.text;

      case TextfieldType.chat:
        return TextInputType.text;

      case TextfieldType.money:
        return TextInputType.number;

      case TextfieldType.number:
        return TextInputType.number;

      case TextfieldType.addressNumber:
        return TextInputType.number;

      case TextfieldType.addressCep:
        return TextInputType.number;

      case TextfieldType.phone:
        return TextInputType.phone;

      case TextfieldType.cpf:
        return TextInputType.phone;

      case TextfieldType.date:
        return TextInputType.datetime;

      case TextfieldType.time:
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }
}
