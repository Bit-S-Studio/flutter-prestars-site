import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class GetButtonTextColor {
  static Color call(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.primary:
        return ThemeService.colors.textWhite;
      case ThemeType.secondary:
        return ThemeService.colors.primary;
      case ThemeType.tertiary:
        return ThemeService.colors.white;
      case ThemeType.confirm:
        return ThemeService.colors.textSecondary;
      case ThemeType.grey:
        return ThemeService.colors.textTerciary;
      case ThemeType.normal:
        return ThemeService.colors.white;
      default:
        return ThemeService.colors.textPrimary;
    }
  }
}
