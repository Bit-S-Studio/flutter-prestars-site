import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UiErrorList extends StatelessWidget {
  final Map<String, String> Function(AbstractControl<dynamic>)?
      validationMessages;
  final String formControlName;
  final bool? hasFirstError;
  final bool showError;
  const UiErrorList(
      {Key? key,
      this.validationMessages,
      required this.formControlName,
      this.showError = true,
      this.hasFirstError = false})
      : super(key: key);

  Map<String, String> _getValidationMessages(AbstractControl<dynamic> control) {
    return validationMessages != null
        ? validationMessages!(control)
        : <String, String>{};
  }

  List<String?> listErrors(AbstractControl control) {
    final errorMessages = _getValidationMessages(control);
    return control.errors.keys.map((e) {
      return errorMessages.containsKey(e) ? errorMessages[e] : e;
    }).toList();
  }

  List<Widget> listErrorsWidgets(List<String?> errors) {
    if (hasFirstError!) {
      return errors
          .map((error) => Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 16),
                child: AutoSizeText(
                  error ?? '',
                  style:
                      TextStyle(height: 1, color: ThemeService.colors.danger),
                  textAlign: TextAlign.left,
                ),
              ))
          .toList();
    } else {
      if (errors.length > 1) {
        errors.removeAt(0);
        return errors
            .map((error) => Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 16),
                  child: AutoSizeText(
                    error ?? '',
                    style:
                        TextStyle(height: 1, color: ThemeService.colors.danger),
                    textAlign: TextAlign.left,
                  ),
                ))
            .toList();
      } else {
        return [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(builder: (_, formGroup, child) {
      var control = formGroup.control(formControlName);
      return (control.invalid && control.touched && showError)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: listErrorsWidgets(listErrors(control)))
          : Container();
    });
  }
}
