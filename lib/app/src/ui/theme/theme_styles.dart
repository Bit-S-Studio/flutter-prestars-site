import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../prestars_exports.dart';

class ThemeStyles {
  TextStyle exo2Body({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textSecondary,
    );
  }

  TextStyle exo2BodyItalic(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 14,
      fontStyle: FontStyle.italic,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle exo2LightTitle(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 32,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle exo2LightBody(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 16,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle exo2Caption({Color? color, double? size, FontWeight? fontWeight}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 18,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textSecondary,
    );
  }

  TextStyle exo2Swith({Color? color, double? size, FontWeight? fontWeight}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 12,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textWhite,
    );
  }

  TextStyle tableTitle({Color? color, double? size, FontWeight? fontWeight}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textWhite,
    );
  }

  TextStyle exo2Overline({Color? color, bool hasUnderline = false}) {
    return GoogleFonts.exo2(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1,
      color: color ?? ThemeService.colors.terciary,
      decoration: hasUnderline ? TextDecoration.underline : null,
    );
  }

  TextStyle exo2Title({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: size ?? 56,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle exo2Subtitle({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 36,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle exo2miniTitle(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: size ?? 24,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle tableBody({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle exo2TitlePrimary(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 20,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle exo2Emphasis({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.exo2(
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: size ?? 56,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textSecondary,
    );
  }

  TextStyle paginationButton(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.ubuntu(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 14,
      color: color ?? ThemeService.colors.textPagination,
    );
  }

  TextStyle paginationBalls(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.ubuntu(
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: size ?? 20,
      height: 2,
      color: color ?? ThemeService.colors.textSecondary,
    );
  }

  TextStyle danger({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.ubuntu(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 14,
      height: 2,
      color: color ?? ThemeService.colors.danger,
    );
  }
}
