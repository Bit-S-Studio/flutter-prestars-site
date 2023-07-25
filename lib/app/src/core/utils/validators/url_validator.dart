import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../prestars_exports.dart';

class UrlValidator extends Validator<dynamic> {
  const UrlValidator() : super();
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final url = control.value as String;
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);

    if (url.isEmpty) {
      return null;
    }
    if (regExp.hasMatch(url)) {
      return null;
    } else {
      control.markAsTouched();
      control.markAsDirty();
      return {ConstantsValidators.URL: true};
    }
  }
}
