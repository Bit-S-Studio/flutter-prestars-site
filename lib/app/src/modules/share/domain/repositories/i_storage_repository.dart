import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../prestars_exports.dart';

abstract class IStorageRepository {
  Future<Either<Failure, String>> call({required XFile file});
}
