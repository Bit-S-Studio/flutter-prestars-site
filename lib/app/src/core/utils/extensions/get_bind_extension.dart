import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension GetBindExtension<T extends Object> on BuildContext {
  T get bind {
    final getIt = GetIt.I;
    return getIt.get<T>();
  }
}
