class GetInitialNameLatters {
  static String call(String name) {
    if (name.isEmpty) {
      return 'NN';
    }
    final names = name.split(' ');
    final latter1 = names.isNotEmpty ? names[0].split('').first : '';
    final latter2 = names.length > 1 ? names[1].split('').first : '';
    return latter1.toUpperCase() + latter2.toUpperCase();
  }
}
