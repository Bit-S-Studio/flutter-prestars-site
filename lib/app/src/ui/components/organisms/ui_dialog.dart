import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../prestars_exports.dart';

class UiDialog extends StatelessWidget {
  final String? text;
  final String? detail;
  final VoidCallback? onPressedPrimaryButton;
  final VoidCallback? onPressedSecondaryButton;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final String? image;
  final Color? titleColor;
  final Widget? icon;
  const UiDialog(
      {Key? key,
      this.text,
      this.detail,
      this.onPressedPrimaryButton,
      this.onPressedSecondaryButton,
      this.primaryButtonText,
      this.secondaryButtonText,
      this.image,
      this.titleColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4,
      backgroundColor: ThemeService.colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        height: context.height * 0.5,
        width: 400,
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (image != null) Image.asset(image ?? ''),
            if (icon != null) icon ?? const SizedBox(),
            Column(
              children: [
                AutoSizeText(
                  text ?? '',
                  style: ThemeService.styles.exo2Body(
                      color: titleColor ?? ThemeService.colors.secondary,
                      size: 21),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                if (detail != null)
                  AutoSizeText(
                    detail ?? '',
                    style: ThemeService.styles
                        .exo2Body(color: ThemeService.colors.textTerciary),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
            if (onPressedPrimaryButton != null)
              UiButton(
                onPressed: onPressedPrimaryButton ?? () => context.pop(),
                themeType: ThemeType.primary,
                label: primaryButtonText ??
                    (onPressedSecondaryButton != null
                        ? 'primary_button_text_error'
                        : 'secondary_button_text_error'),
                width: 200,
              ),
            if (onPressedSecondaryButton != null)
              UiButton(
                onPressed: onPressedSecondaryButton,
                themeType: ThemeType.primary,
                label: secondaryButtonText ?? 'secondary_button_text_error',
              ),
          ],
        ),
      ),
    );
  }
}
