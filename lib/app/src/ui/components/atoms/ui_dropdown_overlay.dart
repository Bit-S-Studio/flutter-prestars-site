import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../../prestars_exports.dart';

class UiDropdownOverlay {
  static OverlayEntry call(BuildContext context,
      {required FormGroup formGroup,
      required LayerLink layerLink,
      required Function(String tag) onPressedExpanded,
      required List<String> tags,
      required FocusNode focusNode,
      required String searchTagsFormControlName,
      required String searchedTagsFormControlName}) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size overlaySize = renderBox.size;
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return OverlayEntry(
      builder: (context) => Positioned(
        width: overlaySize.width,
        bottom: 0.0,
        top: 0.0,
        child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, overlaySize.height + 5.0),
            child: Material(
                elevation: 4.0,
                child: ReactiveForm(
                  formGroup: formGroup,
                  child: ReactiveFormConsumer(builder: (context, form, child) {
                    // ignore: no_leading_underscores_for_local_identifiers
                    final _tags = form
                        .control(searchedTagsFormControlName)
                        .value as List<String>;
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: screenWidth,
                          maxWidth: screenWidth,
                          minHeight: 0,
                          maxHeight: 300,
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _tags.isEmpty ? 1 : _tags.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onPanDown: (_) {
                                  onPressedExpanded(_tags[index]);
                                  focusNode.unfocus();
                                  formGroup
                                      .control(searchTagsFormControlName)
                                      .value = '';
                                },
                                child: ListTile(
                                  title: AutoSizeText(
                                    _tags.isNotEmpty
                                        ? _tags[index]
                                        : 'Adicione itens',
                                    style: ThemeService.styles.exo2Caption(),
                                  ),
                                  onTap: () {
                                    onPressedExpanded(_tags[index]);
                                    focusNode.unfocus();
                                    formGroup
                                        .control(searchTagsFormControlName)
                                        .value = '';
                                  },
                                ),
                              );
                            }),
                      ),
                    );
                  }),
                ))),
      ),
    );
  }
}
