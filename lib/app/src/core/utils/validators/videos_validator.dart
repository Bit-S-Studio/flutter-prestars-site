import 'package:flutter_prestarts_site/prestars_exports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class VideoValidator extends Validator<dynamic> {
  final String controlName;
  final String matchingControlName;

  VideoValidator({
    required this.controlName,
    required this.matchingControlName,
  }) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;
    final matchingFormControl = form.control(matchingControlName);
    final formControlValue = form.control(controlName).value as List<String>;
    final matchingFormControlValue =
        form.control(matchingControlName).value as List<XFile?>;

    if (formControlValue.isEmpty && matchingFormControlValue.isEmpty) {
      matchingFormControl.setErrors({ConstantsValidators.MIN_LENGTH: true});

      // force messages to show up as soon as possible
      matchingFormControl.markAsTouched();
    } else {
      matchingFormControl.removeError(ConstantsValidators.MIN_LENGTH);
    }

    return null;
  }
}
