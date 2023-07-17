import 'package:get_it/get_it.dart';

import '../../../../prestars_exports.dart';

class AthleteBinds {
  static void call({required GetIt getIt}) {
    getIt.registerLazySingleton<IAthleteDatasource>(
        () => AthleteDatasourceImpl(apiService: getIt.get<IApiService>()));
    getIt.registerLazySingleton<IAthleteRepository>(
        () => AthleteRepositoryImpl(getIt.get<IAthleteDatasource>()));
    getIt.registerLazySingleton<ICreateAthleteUseCase>(
        () => CreateAthleteUseCaseImpl(getIt.get<IAthleteRepository>()));
    getIt.registerLazySingleton(() => AthleteForm());
    getIt.registerLazySingleton(() => FieldPositionsController(
        athleteController: getIt.get<AthleteController>()));
    getIt.registerLazySingleton(() => FieldCharacteristicsController(
        athleteController: getIt.get<AthleteController>()));
    getIt.registerLazySingleton(() => AthleteController(
          athleteForm: getIt.get<AthleteForm>(),
          uploadToStorageUseCase: getIt.get<IUploadToStorageUseCase>(),
          createAthleteUseCase: getIt.get<ICreateAthleteUseCase>(),
        )..init());
  }
}
