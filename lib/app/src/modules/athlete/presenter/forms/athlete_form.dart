import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class AthleteForm {
  final formGroup = AthelteFormGroup.call();

  String get uid => formGroup.control(ConstantsForms.id).value;
  String get name => formGroup.control(ConstantsForms.name).value;
  String get email => formGroup.control(ConstantsForms.email).value;
  String get phone => formGroup.control(ConstantsForms.phone).value;
  String get city => formGroup.control(ConstantsForms.city).value;
  String get state => formGroup.control(ConstantsForms.state).value;
  String get imageUrl => formGroup.control(ConstantsForms.image).value;
  String get birth => formGroup.control(ConstantsForms.birth).value;
  String get height => formGroup.control(ConstantsForms.height).value;
  String get heightOfFather =>
      formGroup.control(ConstantsForms.heightOfFather).value;
  String get weight => formGroup.control(ConstantsForms.weight).value;
  bool get favoriteLag => formGroup.control(ConstantsForms.favoriteLag).value;
  List<String> get positionsSearched =>
      formGroup.control(ConstantsForms.positionsSearched).value as List<String>;
  List<String> get selectedPositions =>
      formGroup.control(ConstantsForms.positions).value as List<String>;
  List<String> get characteristicsSearched =>
      formGroup.control(ConstantsForms.characteristicsSearched).value
          as List<String>;
  List<String> get selectedCharacteristics =>
      formGroup.control(ConstantsForms.characteristics).value as List<String>;
  List<XFile?> get videosUrl =>
      formGroup.control(ConstantsForms.videosUrl).value;

  void showErrors() {
    formGroup.markAllAsTouched();
  }

  void reset() {
    formGroup.reset();
  }

  void setPositionsSearched(List<String> positions) {
    for (final selectedPosition in selectedPositions) {
      positions.removeWhere((tag) => tag == selectedPosition);
    }
    formGroup.control(ConstantsForms.positionsSearched).value = positions;
  }

  void setImage(String image) {
    formGroup.control(ConstantsForms.image).value = image;
  }

  void addVideo(XFile value) {
    final videos =
        formGroup.control(ConstantsForms.videosUrl) as FormArray<XFile>;
    videos.add(FormControl<XFile>(value: value));
  }

  set setPosition(String position) {
    formGroup.control(ConstantsForms.positionsSearch).value = position;
  }

  set setCharacteristic(String characteristic) {
    formGroup.control(ConstantsForms.characteristicsSearch).value =
        characteristic;
  }

  void setPositions(List<String> positions) {
    formGroup.control(ConstantsForms.positions).value = positions;
  }

  void setCharacteristicsSearched(List<String> characteristics) {
    for (final selectedCharacteristic in selectedCharacteristics) {
      characteristics.removeWhere((tag) => tag == selectedCharacteristic);
    }
    formGroup.control(ConstantsForms.characteristicsSearched).value =
        characteristics;
  }

  void setCharacteristics(List<String> characteristics) {
    formGroup.control(ConstantsForms.characteristics).value = characteristics;
  }

  Map<String, String> Function(dynamic)? validationMessages = (control) => {
        'required': 'Esse campo precisa ser preenchido',
        'minLength': 'O campo deve ter no minimo 1 item',
      };
}

extension AthleteFormToEntity on AthleteForm {
  AthleteEntity toEntity({String? imageUrl, List<String>? videosUrl}) =>
      AthleteEntity(
        uid: uid,
        name: name,
        email: email,
        phone: phone,
        imageUrl: imageUrl ?? this.imageUrl,
        address: AddressEntity(city: city, state: state),
        birth: birth,
        height: height,
        heightOfFather: heightOfFather,
        weight: weight,
        favoriteLag: favoriteLag ? 'direita' : 'esquerda',
        positions: ConvertFormToListPositions.call(selectedPositions),
        characteristics:
            ConvertFormToListPositions.call(selectedCharacteristics),
        videosUrl: videosUrl ??
            List<String>.from(
                this.videosUrl.map((video) => video?.path ?? '').toList()),
      );
}
