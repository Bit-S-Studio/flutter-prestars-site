// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../prestars_exports.dart';

class AgeValidator extends Validator<dynamic> {
  final int minAge;

  /// Constructs a [MinAgeValidator].
  ///
  /// The argument [minAge] argument must not be null.
  AgeValidator(this.minAge);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if ((control.value as String).length != 10) {
      return null;
    } else {
      final date = control.value;
      String datePattern = "dd/MM/yyyy";

      DateTime birthDate = DateFormat(datePattern).parse(date);
      DateTime today = DateTime.now();

      final yearDiff = today.year - birthDate.year;
      final monthDiff = today.month - birthDate.month;
      final dayDiff = today.day - birthDate.day;

      final isOfAge = yearDiff > minAge ||
          yearDiff == minAge && monthDiff >= 0 && dayDiff >= 0;

      return isOfAge ? null : {ConstantsValidators.AGE: true};
    }
  }
}
