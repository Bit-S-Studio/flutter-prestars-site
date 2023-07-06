import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

part 'home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(InitHome());

  void init() async {
    value = LoadingHome();
  }
}
