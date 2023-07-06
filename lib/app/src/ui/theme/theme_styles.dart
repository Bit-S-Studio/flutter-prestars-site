import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../prestars_exports.dart';

class ThemeStyles {
  TextStyle montserratBody(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle montserratBodyItalic(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 14,
      fontStyle: FontStyle.italic,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle montserratLightTitle(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w300,
      fontSize: size ?? 18,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle osvaldBody({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.oswald(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle montserratCaption(
      {Color? color, double? size, FontWeight? fontWeight}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 18,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle oswaldButton({Color? color, double? size, FontWeight? fontWeight}) {
    return GoogleFonts.oswald(
      fontWeight: fontWeight ?? FontWeight.w700,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textWhite,
    );
  }

  TextStyle montserratSwith(
      {Color? color, double? size, FontWeight? fontWeight}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 12,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textWhite,
    );
  }

  TextStyle tableTitle({Color? color, double? size, FontWeight? fontWeight}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textWhite,
    );
  }

  TextStyle montserratOverline({Color? color, bool hasUnderline = false}) {
    return GoogleFonts.montserrat(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1,
      color: color ?? ThemeService.colors.terciary,
      decoration: hasUnderline ? TextDecoration.underline : null,
    );
  }

  TextStyle montserratTitle(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 18,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle tableBody({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textTerciary,
    );
  }

  TextStyle montserratTitlePrimary(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 20,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }

  TextStyle montserratTitleSplash(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textQuarter,
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

  TextStyle export({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.roboto(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 16,
      height: 2,
      color: color ?? ThemeService.colors.textTerciary,
      shadows: <Shadow>[
        const Shadow(
          offset: Offset(1.0, 1.3),
          blurRadius: 2,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ],
    );
  }
}
