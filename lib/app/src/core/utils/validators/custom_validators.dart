import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../prestars_exports.dart';

class CustomValidators {
  static ValidatorFunction name() => NameValidator().validate;
  static ValidatorFunction url() => const UrlValidator();
}
