import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiTags extends StatelessWidget {
  final List<String> selectedList;
  final bool isEnabled;
  final Function(String tag) onDeleteExpanded;
  const UiTags(
      {super.key,
      required this.selectedList,
      required this.isEnabled,
      required this.onDeleteExpanded});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: selectedList.isEmpty
            ? const SizedBox()
            : Container(
                padding: const EdgeInsets.only(right: 30, top: 26),
                child: Wrap(
                    spacing: 4,
                    runSpacing: 4.0,
                    children: List.generate(
                        selectedList.length,
                        (index) => InputChip(
                            backgroundColor: ThemeService.colors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            label: Text(
                              selectedList[index],
                              style: ThemeService.styles.exo2LightBody(),
                              maxLines: 2,
                            ),
                            deleteIconColor: ThemeService.colors.white,
                            onDeleted: isEnabled
                                ? () {
                                    onDeleteExpanded.call(selectedList[index]);
                                  }
                                : null)))));
  }
}
