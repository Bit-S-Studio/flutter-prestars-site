import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class UiMiniLogo extends StatelessWidget {
  final double? scale;
  const UiMiniLogo({Key? key, this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height * 0.01),
      child: SizedBox(
        height: 46,
        child: Image.asset(
          ThemeService.images.miniLogo,
          scale: scale ?? 1,
        ),
      ),
    );
  }
}
