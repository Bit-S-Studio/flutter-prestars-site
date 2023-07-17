import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

abstract class IUploadToStorageUseCase {
  Future<Either<Failure, String>> call(
      {required String path, required String name});
}

class UploadToStorageUseCaseImpl extends IUploadToStorageUseCase {
  final IStorageRepository _repository;

  UploadToStorageUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, String>> call(
          {required String path, required String name}) async =>
      await _repository.call(path: path, name: name);
}
