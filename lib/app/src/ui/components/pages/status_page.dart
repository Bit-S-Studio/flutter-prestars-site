import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../prestars_exports.dart';

class StatusPage extends StatelessWidget {
  final String title;
  final String? buttonTitle;
  final String image;
  final double? width;
  final double? height;
  final bool isSvg;
  final VoidCallback? onPressed;
  const StatusPage({
    Key? key,
    required this.title,
    this.buttonTitle,
    required this.image,
    this.isSvg = false,
    this.onPressed,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 52, left: 52),
            child: AutoSizeText(
              title,
              style: ThemeService.styles
                  .exo2Body(color: ThemeService.colors.textPrimary),
              textAlign: TextAlign.center,
              maxFontSize: 20,
              minFontSize: 12,
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 37),
            child: isSvg
                ? SvgPicture.asset(
                    image,
                    height: height ?? 170,
                    width: width ?? 170,
                    fit: BoxFit.contain,
                  )
                : SizedBox(
                    height: height != null ? height! + 15 : 185,
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                      height: height ?? 170,
                      width: width ?? 170,
                    ),
                  ),
          ),
          if (onPressed != null)
            UiButton(onPressed: onPressed, label: buttonTitle ?? '')
        ],
      ),
    );
  }
}
