import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class UiPaginationButton extends StatelessWidget {
  final bool isCurrent;
  final Widget child;
  final VoidCallback onTap;
  const UiPaginationButton(
      {super.key,
      required this.isCurrent,
      required this.child,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(20),
            child: CircleAvatar(
                radius: 14.2,
                backgroundColor: ThemeService.colors.border,
                child: CircleAvatar(
                    radius: 14,
                    backgroundColor: isCurrent
                        ? ThemeService.colors.primary
                        : ThemeService.colors.terciary,
                    child: child))),
      ),
    );
  }
}
