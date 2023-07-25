import 'package:flutter/material.dart';
import 'package:flutter_prestarts_site/app/_exports.dart';

class UiLoading extends StatelessWidget {
  final Color? color;
  const UiLoading({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: color ?? ThemeService.colors.primary,
      ),
    );
  }
}
