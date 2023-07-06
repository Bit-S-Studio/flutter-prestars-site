import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiTags extends StatelessWidget {
  final List<TagModel> selectedList;
  final bool isEnabled;
  final Function(TagModel tag) onDeleteExpanded;
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
                            backgroundColor: ThemeService.colors.interestItem,
                            label: AutoSizeText(
                              selectedList[index].label ?? '',
                              style: ThemeService.styles.montserratBody(),
                              maxFontSize: 16,
                              minFontSize: 10,
                              maxLines: 2,
                            ),
                            deleteIconColor: ThemeService.colors.iconPrimary,
                            onDeleted: isEnabled
                                ? () {
                                    onDeleteExpanded.call(selectedList[index]);
                                  }
                                : null)))));
  }
}
