import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class AthleteSubmitProcess {
  static void call(BuildContext context, AthleteState value,
      AthleteController controller) {
    if (value is SuccessAthlete) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ShowSuccessDialog.call(context,
            text: ConstantsStrings.successDialogTitle, then: (() {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            AthleteResetForm.call(controller.athleteForm.formGroup);
          });
        }));
      });
    } else if (value is ErrorAthlete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (context) => UiErrorDialog(
                  error: value.failure,
                  primaryButtonText: ConstantsStrings.tryAgain,
                  secondaryButtonText: ConstantsStrings.close,
                  onPressedPrimaryButton: () async {
                    Navigator.pop(context);
                    final isValid = controller.athleteForm.formGroup.valid;

                    isValid
                        ? controller.submit()
                        : AtheleteFormShowErrors.call(
                            controller.athleteForm.formGroup);
                  },
                  onPressedSecondaryButton: () => Navigator.pop(context),
                ));
      });
    }
  }
}
