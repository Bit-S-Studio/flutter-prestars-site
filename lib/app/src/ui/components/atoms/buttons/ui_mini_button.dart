import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class UiMiniButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final bool isSelect;
  final String title;
  final Widget? icon;
  final TextStyle? style;
  const UiMiniButton({
    Key? key,
    this.height,
    this.width,
    required this.onPressed,
    required this.title,
    this.isSelect = false,
    this.icon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: height ?? 33,
        width: width,
        decoration: BoxDecoration(
          color: isSelect ? null : ThemeService.colors.terciary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onPressed,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      title,
                      style: style ??
                          (height != null
                              ? ThemeService.styles
                                  .exo2Body(color: Colors.white)
                              : ThemeService.styles
                                  .exo2Body(color: Colors.white)),
                    ),
                    const SizedBox(width: 8),
                    icon!,
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AutoSizeText(
                      title,
                      style: style ??
                          (height != null
                              ? ThemeService.styles.exo2Body(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)
                              : ThemeService.styles.exo2Body(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
