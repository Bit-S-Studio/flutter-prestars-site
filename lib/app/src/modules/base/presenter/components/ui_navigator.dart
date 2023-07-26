import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class UiNavigator extends StatelessWidget {
  final BaseNavigatorController controller;
  const UiNavigator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TabEntity>>(
        valueListenable: controller,
        builder: (_, value, child) {
          return SizedBox(
            height: 60,
            child: ListView.builder(
                itemCount: value.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                      height: 20,
                      child: TextButton(
                          onPressed: () =>
                              controller.onItemTapped(context, index),
                          child: Text(
                            value[index].label,
                            style: ThemeService.styles.exo2Body(
                                color: index == controller.currentIndex(context)
                                    ? ThemeService.colors.textPrimary
                                    : null),
                          )),
                    )),
          );
        });
  }
}
