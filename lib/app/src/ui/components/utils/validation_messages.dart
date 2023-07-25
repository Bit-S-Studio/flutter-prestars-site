import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class ValidationMessages {
  static Map<String, ValidationMessageFunction> value({
    ValidationMessageFunction? requiredLabel,
    ValidationMessageFunction? minLengthLabel,
    ValidationMessageFunction? maxLengthLabel,
    ValidationMessageFunction? patternLabel,
    ValidationMessageFunction? emptyArrayLabel,
    int? minNumber,
    int? maxNumber,
    String? formControlName,
  }) =>
      {
        ConstantsValidators.REQUIRED: requiredLabel ??
            (error) => 'O campo ${formControlName ?? ''} é obrigatório',
        ConstantsValidators.MIN_LENGTH: minLengthLabel ??
            (error) {
              final errorMap = (error as Map<String, dynamic>);
              final requiredLenght = errorMap['requiredLength'];
              return 'O campo deve ter no minimo ${minNumber ?? requiredLenght} caracteres';
            },
        ConstantsValidators.MIN: minLengthLabel ??
            (error) => 'O campo ${formControlName ?? ''} é obrigatório',
        ConstantsValidators.MAX_LENGTH: maxLengthLabel ??
            (error) =>
                'O campo deve ter no máximo ${maxNumber ?? '100'} caracteres',
        ConstantsValidators.PATTERN:
            patternLabel ?? (error) => 'O campo está com o formato incorreto',
        ConstantsValidators.NAME:
            patternLabel ?? (error) => 'Digite seu nome completo',
        ConstantsValidators.ZERO: emptyArrayLabel ??
            (error) => 'O campo deve ter no minimo 1 item adicionado',
        ConstantsValidators.WRONG_FORMMATING:
            patternLabel ?? (error) => 'O campo está com o formato incorreto',
        ConstantsValidators.SPECIAL_CHARACTER:
            emptyArrayLabel ?? (error) => 'Não utilize caracteres especiais',
        ConstantsValidators.MUST_MATCH:
            emptyArrayLabel ?? (error) => 'As senhas não conferem',
        ConstantsValidators.EMAIL:
            emptyArrayLabel ?? (error) => 'O E-mail não é válido',
        ConstantsValidators.AGE:
            emptyArrayLabel ?? (error) => 'A idade mínima é de 18 anos.',
        ConstantsValidators.URL:
            emptyArrayLabel ?? (error) => 'A link é inválida',
      };

  List<Map<String, dynamic>? Function(AbstractControl<dynamic>)> validations({
    String? requiredLabel,
    String? minLengthLabel,
    String? maxLengthLabel,
    String? patternLabel,
    String? emptyArrayLabel,
    String? minNumber,
    String? maxNumber,
  }) {
    final listRequired =
        <Map<String, dynamic>? Function(AbstractControl<dynamic>)>[];
    if (requiredLabel != null) {
      listRequired.add(Validators.required);
    }
    if (minLengthLabel != null) {
      listRequired.add(Validators.minLength(int.parse(minLengthLabel)));
    }
    if (maxLengthLabel != null) {
      listRequired.add(Validators.maxLength(int.parse(maxLengthLabel)));
    }
    if (patternLabel != null) {
      listRequired.add(Validators.pattern(patternLabel));
    }
    if (emptyArrayLabel != null) {
      listRequired.add(Validators.required);
    }
    if (minNumber != null) {
      listRequired.add(Validators.min(minNumber));
    }
    if (maxNumber != null) {
      listRequired.add(Validators.max(maxNumber));
    }

    return listRequired;
  }
}
