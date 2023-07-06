import '../../../../../prestars_exports.dart';

class DropDownGetIndexLabel {
  static int call(TagModel value, List<TagModel> tagList) {
    try {
      final temp =
          tagList.firstWhere((element) => element.label == value.label);
      final tempIndex = tagList.indexOf(temp);
      return tempIndex;
    } catch (e) {
      return -1;
    }
  }
}
