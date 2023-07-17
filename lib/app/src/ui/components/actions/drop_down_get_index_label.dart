class DropDownGetIndexLabel {
  static int call(String value, List<String> tagList) {
    try {
      final temp = tagList.firstWhere((element) => element == value);
      final tempIndex = tagList.indexOf(temp);
      return tempIndex;
    } catch (e) {
      return -1;
    }
  }
}
