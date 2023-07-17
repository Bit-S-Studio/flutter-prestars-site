import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class AthelteFormGroup {
  static FormGroup call() => FormGroup({
        ConstantsForms.id: FormControl<String>(value: ''),
        ConstantsForms.name: FormControl<String>(
            value: '',
            validators: [Validators.required, Validators.minLength(3)]),
        ConstantsForms.email: FormControl<String>(
            value: '', validators: [Validators.required, Validators.email]),
        ConstantsForms.phone:
            FormControl<String>(value: '', validators: [Validators.required]),
        ConstantsForms.image:
            FormControl<String>(value: '', validators: [Validators.required]),
        ConstantsForms.birth: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(10),
        ]),
        ConstantsForms.height:
            FormControl<String>(value: '', validators: [Validators.required]),
        ConstantsForms.heightOfFather: FormControl<String>(value: ''),
        ConstantsForms.city:
            FormControl<String>(value: '', validators: [Validators.required]),
        ConstantsForms.state:
            FormControl<String>(value: '', validators: [Validators.required]),
        ConstantsForms.weight:
            FormControl<String>(value: '', validators: [Validators.required]),
        ConstantsForms.favoriteLag:
            FormControl<bool>(value: true, validators: [Validators.required]),
        ConstantsForms.positions: FormControl<List<String>>(
            value: <String>[],
            validators: [Validators.required, Validators.minLength(1)]),
        ConstantsForms.positionsSearched:
            FormControl<List<String>>(value: <String>[]),
        ConstantsForms.positionsSearch: FormControl<String>(value: ''),
        ConstantsForms.characteristics: FormControl<List<String>>(
            value: <String>[],
            validators: [Validators.required, Validators.minLength(1)]),
        ConstantsForms.characteristicsSearched:
            FormControl<List<String>>(value: <String>[]),
        ConstantsForms.characteristicsSearch: FormControl<String>(value: ''),
        ConstantsForms.videosUrl:
            FormArray<XFile>([], validators: [Validators.minLength(1)]),
      });
}
