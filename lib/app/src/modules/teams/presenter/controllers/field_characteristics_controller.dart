import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';
part 'field_characteristics_state.dart';

class FieldCharacteristicsController
    extends ValueNotifier<FieldCharacteristicsState> {
  final AthleteController athleteController;
  FieldCharacteristicsController({required this.athleteController})
      : super(InitFieldCharacteristics());

  Future<void> init() async {
    value = LoadingFieldCharacteristics();
    // ignore: no_leading_underscores_for_local_identifiers
    await getCharacteristics('');
  }

  Future<List<String>> getCharacteristics(String pattern) async {
    final result = GetCharacteristicsList.call();

    final selectedCharacteristics =
        athleteController.athleteForm.selectedCharacteristics;
    if (pattern.isNotEmpty) {
      for (var selectedCharacteristic in selectedCharacteristics) {
        if (result.contains(selectedCharacteristic)) {
          result.remove(selectedCharacteristic);
        }
      }
      final tempCharacteristics = result
          .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
          .toList();
      value = SuccessFieldCharacteristics(characteristics: tempCharacteristics);
      return tempCharacteristics;
    } else {
      return result;
    }
  }
}
