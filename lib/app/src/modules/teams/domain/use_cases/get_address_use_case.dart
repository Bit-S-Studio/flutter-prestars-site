import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';


abstract class IGetAddressUseCase {
  Future<Either<Failure, AddressEntity>> call({required String cep});
}

class GetAddressUseCaseImpl extends IGetAddressUseCase {
  final IAddressRepository _repository;

  GetAddressUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, AddressEntity>> call({required String cep}) async =>
      await _repository.call(cep: cep);
}
