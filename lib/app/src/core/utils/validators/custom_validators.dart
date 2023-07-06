import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../prestars_exports.dart';

class CustomValidators {
  static ValidatorFunction minAge(int minAge) => AgeValidator(minAge).validate;
  static ValidatorFunction name() => NameValidator().validate;
}
