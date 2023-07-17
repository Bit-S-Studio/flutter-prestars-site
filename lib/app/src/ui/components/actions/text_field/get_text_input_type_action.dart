import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

import '../../../../../../prestars_exports.dart';

class GetTextInputFormatters {
  static List<TextInputFormatter> call(
    TextfieldType type,
  ) {
    switch (type) {
      case TextfieldType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ];

      case TextfieldType.addressCep:
        return [
          FilteringTextInputFormatter.digitsOnly,
          CepInputFormatter(ponto: false),
        ];

      case TextfieldType.cpf:
        return [
          FilteringTextInputFormatter.digitsOnly,
          CpfInputFormatter(),
        ];
      case TextfieldType.date:
        return [
          // obrigatório
          FilteringTextInputFormatter.digitsOnly,
          DataInputFormatter(),
          DateInputFormat()
        ];
      case TextfieldType.time:
        return [
          // obrigatório
          FilteringTextInputFormatter.digitsOnly,
          HoraInputFormatter(),
        ];
      case TextfieldType.height:
        return [
          // obrigatório
          FilteringTextInputFormatter.digitsOnly,
          AlturaInputFormatter(),
        ];
      case TextfieldType.weight:
        return [
          // obrigatório
          FilteringTextInputFormatter.digitsOnly,
          PesoInputFormatter(),
        ];
      case TextfieldType.name:
        return [
          // obrigatório
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\\s]")),
        ];

      default:
        return [];
    }
  }
}
