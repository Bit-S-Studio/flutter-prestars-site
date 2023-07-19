import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../prestars_exports.dart';

abstract class IUploadToStorageUseCase {
  Future<Either<Failure, String>> call({required XFile file});
}

class UploadToStorageUseCaseImpl extends IUploadToStorageUseCase {
  final IStorageRepository _repository;

  UploadToStorageUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, String>> call({required XFile file}) async =>
      await _repository.call(file: file);
}
