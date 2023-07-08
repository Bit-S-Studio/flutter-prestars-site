import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../prestars_exports.dart';

class ThemeIcons {
  final double defaultSize = 20;
  SvgPicture get facebookIcon => SvgPicture.asset(
        'icons/facebook.svg',
        height: defaultSize,
        width: defaultSize,
        colorFilter:
            ColorFilter.mode(ThemeService.colors.white, BlendMode.srcIn),
      );
  SvgPicture get instagramIcon => SvgPicture.asset(
        height: defaultSize,
        width: defaultSize,
        'icons/instagram.svg',
        colorFilter:
            ColorFilter.mode(ThemeService.colors.white, BlendMode.srcIn),
      );
  SvgPicture get linkedinIcon => SvgPicture.asset(
        height: defaultSize,
        width: defaultSize,
        'icons/linkedin.svg',
        colorFilter:
            ColorFilter.mode(ThemeService.colors.white, BlendMode.srcIn),
      );
}
