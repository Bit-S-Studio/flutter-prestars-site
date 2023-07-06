import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class GetTextInputAction {
  static TextInputAction call(
    TextfieldType type,
  ) {
    switch (type) {
      case TextfieldType.text:
        return TextInputAction.done;

      case TextfieldType.phone:
        return TextInputAction.done;

      case TextfieldType.chat:
        return TextInputAction.done;

      default:
        return TextInputAction.done;
    }
  }
}
