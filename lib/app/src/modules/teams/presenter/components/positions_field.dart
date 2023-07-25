import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class PositionsField extends StatefulWidget {
  const PositionsField({Key? key}) : super(key: key);

  @override
  State<PositionsField> createState() => _PositionsFieldState();
}

class _PositionsFieldState extends State<PositionsField> {
  final controller = GetIt.I.get<FieldPositionsController>();
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final athleteForm = controller.athleteController.athleteForm;
    return ReactiveFormConsumer(builder: (context, form, child) {
      return ReactiveFormBuilder(
          form: () => athleteForm.formGroup,
          builder: (context, form, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ReactiveMultiSelect(
                  formGroup: athleteForm.formGroup,
                  formControlName: ConstantsForms.positions,
                  searchedTagsFormControlName: ConstantsForms.positionsSearched,
                  searchTagsFormControlName: ConstantsForms.positionsSearch,
                  isMandatory: true,
                  labelText: ConstantsLabels.positionsTextField,
                  hint: ConstantsLabels.selectOptions,
                  validationMessages: athleteForm.validationMessages,
                  tagList: athleteForm.positionsSearched,
                  setValue: (value) => athleteForm.setPosition = value,
                  searchFunction: (search) => controller.getPositions(search)),
            );
          });
    });
  }
}
