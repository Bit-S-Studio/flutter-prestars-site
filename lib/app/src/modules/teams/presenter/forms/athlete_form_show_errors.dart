import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';


class AtheleteFormShowErrors {
  static void call(FormGroup formGroup) {
    formGroup.control(ConstantsForms.name).markAsDirty();
    formGroup.control(ConstantsForms.image).markAsDirty();
    formGroup.control(ConstantsForms.email).markAsDirty();
    formGroup.control(ConstantsForms.phone).markAsDirty();
    formGroup.control(ConstantsForms.birth).markAsDirty();
    formGroup.control(ConstantsForms.city).markAsDirty();
    formGroup.control(ConstantsForms.state).markAsDirty();
    formGroup.control(ConstantsForms.favoriteLag).markAsDirty();
    formGroup.control(ConstantsForms.height).markAsDirty();
    formGroup.control(ConstantsForms.heightOfFather).markAsDirty();
    formGroup.control(ConstantsForms.weight).markAsDirty();
    formGroup.control(ConstantsForms.videosUrl).markAsDirty();
    formGroup.control(ConstantsForms.positions).markAsDirty();
    formGroup.control(ConstantsForms.characteristics).markAsDirty();
  }
}
