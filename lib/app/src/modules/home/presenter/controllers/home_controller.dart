import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

part 'home_state.dart';

class HomeController extends ValueNotifier<int> {
  HomeController() : super(0);

  void changeValue({required int newValue}) {
    value = newValue;
  }
}
