import 'package:auto_size_text/auto_size_text.dart';
import '../../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final ThemeType themeType;
  final bool isMini;
  final EdgeInsets? padding;
  final bool isLoading;
  final Color? buttonColor;
  final Widget? preffix;
  final double? width;
  final double? radius;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;
  final double? fontSize;
  const UiButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.themeType = ThemeType.primary,
    this.isMini = false,
    this.padding,
    this.isLoading = false,
    this.preffix,
    this.width,
    this.height,
    this.fontSize,
    this.buttonColor,
    this.mainAxisAlignment,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: height ?? 70,
        width: width ??
            (isMini
                ? context.isDesktop
                    ? 150
                    : 100
                : context.isDesktop
                    ? context.width * 0.2
                    : double.infinity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: buttonColor != null ? null : GetButtonColor.call(themeType),
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 8,
              backgroundColor:
                  buttonColor != null ? null : GetButtonColor.call(themeType),
              padding: padding,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ).merge(
              ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 10),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
                elevation: themeType == ThemeType.secondary
                    ? MaterialStateProperty.all(5)
                    : MaterialStateProperty.all(0),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  if (isLoading) const UiLoading(),
                  if (preffix != null && !isLoading)
                    preffix ?? const SizedBox(),
                  if (preffix != null && !isLoading) const SizedBox(width: 12),
                  if (!isLoading)
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: AutoSizeText(
                          label,
                          overflow: TextOverflow.fade,
                          maxFontSize: fontSize ?? 16,
                          minFontSize: 10,
                          maxLines: 1,
                          style: ThemeService.styles.exo2Body(
                              size: fontSize,
                              color: GetButtonTextColor.call(themeType),
                              fontWeight: themeType == ThemeType.tertiary
                                  ? FontWeight.w400
                                  : null),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
