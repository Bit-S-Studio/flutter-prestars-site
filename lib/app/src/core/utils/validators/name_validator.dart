import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../prestars_exports.dart';

class NameValidator extends Validator<dynamic> {
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if ((control.value as String).contains(' ')) {
      return null;
    } else {
      return {ConstantsValidators.NAME: true};
    }
  }
}
