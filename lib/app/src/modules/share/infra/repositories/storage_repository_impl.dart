import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../prestars_exports.dart';

class StorageRepositoryImpl extends IStorageRepository {
  final IStorageDatasource _datasource;

  StorageRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, String>> call({required XFile file}) async {
    try {
      final result = await _datasource.call(file: file);
      return right(result);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
