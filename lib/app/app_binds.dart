import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import '../prestars_exports.dart';

class AppBinds {
  static GetIt getIt = GetIt.instance;
  static void call() {
    getIt.registerSingleton(Dio());
    getIt
        .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
    getIt.registerSingleton<IEnvironmentService>(
        EnvironmentServer.fromLocalEnv());
    getIt.registerSingleton<IConfigsService>(
        ConfigsService(environmentServer: getIt.get<IEnvironmentService>()));
    getIt.registerSingleton<IApiService>(ApiService());
    ShareBinds.call(getIt: getIt);
    AthleteBinds.call(getIt: getIt);
    HomeBinds.call(getIt: getIt);
  }
}
