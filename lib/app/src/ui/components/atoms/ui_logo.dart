import 'package:flutter/material.dart';
import '../../../../../prestars_exports.dart';

class UiLogo extends StatelessWidget {
  final double? scale;
  final double? height;
  final bool isMobile;
  const UiLogo({Key? key, this.height, this.scale, this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: 400,
      child: Image.asset(
        ThemeService.images.completeLogo,
        filterQuality: FilterQuality.high,
        fit: BoxFit.contain,
      ),
    );
  }
}
