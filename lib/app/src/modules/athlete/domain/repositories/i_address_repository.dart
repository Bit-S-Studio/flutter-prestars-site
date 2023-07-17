import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

abstract class IAddressRepository {
  Future<Either<Failure, AddressEntity>> call({required String cep});
}
