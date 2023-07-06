import 'package:get_it/get_it.dart';

import '../../../../prestars_exports.dart';

class HomeBinds {
  static void call({required GetIt getIt}) {
    getIt.registerLazySingleton(() => HomeController());
  }
}
