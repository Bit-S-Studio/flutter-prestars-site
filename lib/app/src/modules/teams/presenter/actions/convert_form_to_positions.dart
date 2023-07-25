class ConvertFormToListPositions {
  static List<String> call(List<String> tags) {
    var roles = <String>[];
    for (var tag in tags) {
      roles.add(tag);
    }
    return roles;
  }
}
