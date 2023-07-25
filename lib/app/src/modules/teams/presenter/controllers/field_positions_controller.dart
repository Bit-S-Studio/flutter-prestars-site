import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';
part 'field_positions_state.dart';

class FieldPositionsController extends ValueNotifier<FieldPositionsState> {
  final AthleteController athleteController;
  FieldPositionsController({required this.athleteController})
      : super(InitFieldPositions());

  Future<void> init() async {
    value = LoadingFieldPositions();
    // ignore: no_leading_underscores_for_local_identifiers
    await getPositions('');
  }

  Future<List<String>> getPositions(String pattern) async {
    final result = GetPositionsList.call();
    final selectedPositions = athleteController.athleteForm.selectedPositions;

    if (pattern.isNotEmpty) {
      for (var selectedPosition in selectedPositions) {
        if (result.contains(selectedPosition)) {
          result.remove(selectedPosition);
        }
      }
      final tempPositions = result
          .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
          .toList();
      value = SuccessFieldPositions(positions: tempPositions);
      return tempPositions;
    } else {
      return result;
    }
  }
}
