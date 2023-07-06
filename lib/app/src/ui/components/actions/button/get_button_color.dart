import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class GetButtonColor {
  static Color call(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.primary:
        return ThemeService.colors.buttonPrimary;
      case ThemeType.secondary:
        return ThemeService.colors.secondary;
      case ThemeType.tertiary:
        return ThemeService.colors.iconSecondary;
      case ThemeType.confirm:
        return ThemeService.colors.secondary;
      case ThemeType.danger:
        return ThemeService.colors.danger;
      case ThemeType.inactive:
        return ThemeService.colors.terciary;
      case ThemeType.edit:
        return ThemeService.colors.terciary;
      case ThemeType.grey:
        return ThemeService.colors.terciary;
      case ThemeType.normal:
        return ThemeService.colors.primary;
      default:
        return ThemeService.colors.primary;
    }
  }
}
