import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class AthleteResetForm {
  static void call(FormGroup formGroup) {
    formGroup.control(ConstantsForms.name).value = '';
    formGroup.control(ConstantsForms.image).value = '';
    formGroup.control(ConstantsForms.email).value = '';
    formGroup.control(ConstantsForms.phone).value = '';
    formGroup.control(ConstantsForms.birth).value = '';
    formGroup.control(ConstantsForms.city).value = '';
    formGroup.control(ConstantsForms.state).value = '';
    formGroup.control(ConstantsForms.favoriteLag).value = false;
    formGroup.control(ConstantsForms.height).value = '';
    formGroup.control(ConstantsForms.heightOfFather).value = '';
    formGroup.control(ConstantsForms.weight).value = '';
    formGroup.control(ConstantsForms.videosUrl).value = [];
    formGroup.control(ConstantsForms.positions).value = [];
    formGroup.control(ConstantsForms.characteristics).value = [];
  }
}
