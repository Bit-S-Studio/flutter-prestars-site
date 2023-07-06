import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UiLogoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String logo;
  const UiLogoButton({Key? key, required this.onPressed, required this.logo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: 53,
        width: 70,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(12.5),
            child: SvgPicture.asset(
              logo,
            ),
          ),
        ),
      ),
    );
  }
}
