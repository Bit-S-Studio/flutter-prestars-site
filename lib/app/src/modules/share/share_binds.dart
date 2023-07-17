import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import '../../../../prestars_exports.dart';

class ShareBinds {
  static void call({required GetIt getIt}) {
    getIt.registerLazySingleton<IStorageDatasource>(
        () => StorageDatasourceImpl(storage: getIt.get<FirebaseStorage>()));
    getIt.registerLazySingleton<IStorageRepository>(
        () => StorageRepositoryImpl(getIt.get<IStorageDatasource>()));
    getIt.registerLazySingleton<IUploadToStorageUseCase>(
        () => UploadToStorageUseCaseImpl(getIt.get<IStorageRepository>()));
  }
}
