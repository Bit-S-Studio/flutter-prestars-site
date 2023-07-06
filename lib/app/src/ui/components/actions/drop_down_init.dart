import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class DropDownInit {
  static void call(
    List<TagModel> tags,
    FormGroup form,
    String selectedTagsFormControlName,
    String searchedTagsFormControlName,
  ) {
    final selectedTags =
        form.control(selectedTagsFormControlName).value as List<TagModel>;
    for (final selectedTag in selectedTags) {
      tags.removeWhere((tag) => selectedTag.value == (tag.value ?? 0));
    }
    form.control(searchedTagsFormControlName).value = tags;
  }
}
