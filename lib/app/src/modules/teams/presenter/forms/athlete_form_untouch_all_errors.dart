import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../../prestars_exports.dart';

class AthleteFormUntouchAllErrors {
  static void call(FormGroup formGroup) {
    formGroup.control(ConstantsForms.name).markAsUntouched();
    formGroup.control(ConstantsForms.image).markAsUntouched();
    formGroup.control(ConstantsForms.email).markAsUntouched();
    formGroup.control(ConstantsForms.phone).markAsUntouched();
    formGroup.control(ConstantsForms.birth).markAsUntouched();
    formGroup.control(ConstantsForms.city).markAsUntouched();
    formGroup.control(ConstantsForms.state).markAsUntouched();
    formGroup.control(ConstantsForms.favoriteLag).markAsUntouched();
    formGroup.control(ConstantsForms.height).markAsUntouched();
    formGroup.control(ConstantsForms.heightOfFather).markAsUntouched();
    formGroup.control(ConstantsForms.weight).markAsUntouched();
    formGroup.control(ConstantsForms.videosUrl).markAsUntouched();
    formGroup.control(ConstantsForms.videos).markAsUntouched();
    formGroup.control(ConstantsForms.positions).markAsUntouched();
    formGroup.control(ConstantsForms.characteristics).markAsUntouched();
  }
}
