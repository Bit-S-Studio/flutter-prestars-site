import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

class AddressRepositoryImpl extends IAddressRepository {
  final IAddressDatasource _datasource;

  AddressRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, AddressEntity>> call({required String cep}) async {
    try {
      final result = await _datasource.call(cep: cep);
      return right(result);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
