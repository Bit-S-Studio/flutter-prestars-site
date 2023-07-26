import 'package:flutter/material.dart';
import 'package:flutter_prestarts_site/app/_exports.dart';

class DefaultPage extends StatelessWidget {
  final Widget child;
  const DefaultPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
            child: child,
          ),
          const UiFooter()
        ],
      ),
    );
  }
}
