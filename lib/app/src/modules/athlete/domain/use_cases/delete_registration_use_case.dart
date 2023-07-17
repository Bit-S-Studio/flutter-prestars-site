import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

abstract class IDeleteAthleteUseCase {
  Future<Either<Failure, SuccessResponse>> call({required String id});
}

class DeleteAthleteUseCaseImpl extends IDeleteAthleteUseCase {
  final IAthleteRepository _repository;

  DeleteAthleteUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, SuccessResponse>> call({required String id}) async =>
      await _repository.delete(id: id);
}
