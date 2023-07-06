import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class DropDownGetTags {
  static void call(
      {required List<TagModel> tags,
      required FormGroup form,
      required String selectedTagsFormControlName,
      required String searchedTagsFormControlName,
      required String searchTagsFormControlName,
      required Function(String) searchFunction}) {
    form.control(searchTagsFormControlName).valueChanges.listen((search) {
      // ignore: no_leading_underscores_for_local_identifiers
      final _search = search as String?;
      DropDownInit.call(
          tags, form, selectedTagsFormControlName, searchedTagsFormControlName);
      if (_search != null && _search.isNotEmpty) {
        // final filtedTags = tags
        //     .where((tag) =>
        //         (tag.label ?? '').toLowerCase().contains(_search.toLowerCase()))
        //     .toList();
        // form.control(searchedTagsFormControlName).value = filtedTags;
        searchFunction(_search);
      } else {
        form.control(searchedTagsFormControlName).value = tags;
      }
    });
  }
}
