import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class AthleteSubmitButton extends StatelessWidget {
  final AthleteController controller;
  const AthleteSubmitButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ValueListenableBuilder<AthleteState>(
          valueListenable: controller,
          builder: (context, value, child) {
            AthleteSubmitProcess.call(context, value, controller);
            return ReactiveForm(
              formGroup: controller.athleteForm.formGroup,
              child: ReactiveFormConsumer(builder: (context, form, child) {
                final isValid = form.valid;
                return UiButton(
                  height: 60,
                  onPressed: isValid ? () async => controller.submit() : null,
                  isLoading: value is LoadingAthlete,
                  label: ConstantsLabels.save,
                  themeType: isValid ? ThemeType.secondary : ThemeType.inactive,
                );
              }),
            );
          }),
    );
  }
}
