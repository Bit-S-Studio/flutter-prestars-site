import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

abstract class IStorageRepository {
  Future<Either<Failure, String>> call(
      {required String path, required String name});
}
