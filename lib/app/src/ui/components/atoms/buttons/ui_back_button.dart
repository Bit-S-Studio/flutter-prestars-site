import 'package:go_router/go_router.dart';
import '../../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';

class UiBackButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const UiBackButton({Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context.pop(),
        padding: padding ?? const EdgeInsets.all(8.0),
        icon: Icon(
          Icons.arrow_back,
          color: ThemeService.colors.textTerciary,
        ));
  }
}
