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
    return Padding(
      padding: EdgeInsets.all(context.height * 0.03),
      child: Center(
        child: SizedBox(
          height: height ?? 60,
          child: Image.asset(
            ThemeService.images.logo,
            // scale: scale ?? 1,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
