import 'package:image_picker/image_picker.dart';
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
    formGroup.control(ConstantsForms.favoriteLag).value = true;
    formGroup.control(ConstantsForms.height).value = null;
    formGroup.control(ConstantsForms.heightOfFather).value = null;
    formGroup.control(ConstantsForms.weight).value = null;
    formGroup.control(ConstantsForms.videosUrl).value = <String>[];
    formGroup.control(ConstantsForms.positions).value = <String>[];
    formGroup.control(ConstantsForms.positionsSearched).value = <String>[];
    formGroup.control(ConstantsForms.characteristics).value = <String>[];
    formGroup.control(ConstantsForms.characteristicsSearched).value = <String>[];
    formGroup.control(ConstantsForms.videos).value = <XFile>[];
  }
}
