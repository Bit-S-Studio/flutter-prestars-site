import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

class StorageRepositoryImpl extends IStorageRepository {
  final IStorageDatasource _datasource;

  StorageRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, String>> call({required String path, required String name}) async {
    try {
      final result = await _datasource.call(path: path, name: name);
      return right(result);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
