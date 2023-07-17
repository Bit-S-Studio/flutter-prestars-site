import 'package:reactive_forms/reactive_forms.dart';

class DropDownInit {
  static void call(
    List<String> tags,
    FormGroup form,
    String selectedTagsFormControlName,
    String searchedTagsFormControlName,
  ) {
    final selectedTags =
        form.control(selectedTagsFormControlName).value as List<String>;
    for (final selectedTag in selectedTags) {
      tags.removeWhere((tag) => selectedTag == (tag));
    }
    form.control(searchedTagsFormControlName).value = tags;
  }
}
