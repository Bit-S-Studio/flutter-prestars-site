import '../../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';

class UiIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final ThemeType themeType;
  final bool isMini;
  final EdgeInsets? padding;
  final bool isLoading;
  final Color? buttonColor;
  final Widget icon;
  final double? width;
  final double? radius;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;
  final double? fontSize;
  const UiIconButton({
    Key? key,
    required this.onPressed,
    this.themeType = ThemeType.primary,
    this.isMini = false,
    this.padding,
    this.isLoading = false,
    required this.icon,
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
        height: height ?? 45,
        width: width ?? 45,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: buttonColor != null ? null : GetButtonColor.call(themeType),
            borderRadius: BorderRadius.circular(radius ?? 16),
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
                    borderRadius: BorderRadius.circular(radius ?? 16),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
                elevation: themeType == ThemeType.secondary
                    ? MaterialStateProperty.all(5)
                    : MaterialStateProperty.all(0),
              ),
            ),
            child: Center(
              child: isLoading ? const UiLoading() : icon,
            ),
          ),
        ),
      );
    });
  }
}
