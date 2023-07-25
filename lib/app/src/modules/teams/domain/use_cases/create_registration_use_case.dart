import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

abstract class ICreateAthleteUseCase {
  Future<Either<Failure, AthleteEntity>> call({required AthleteEntity entity});
}

class CreateAthleteUseCaseImpl extends ICreateAthleteUseCase {
  final IAthleteRepository _repository;

  CreateAthleteUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, AthleteEntity>> call(
          {required AthleteEntity entity}) async =>
      await _repository.create(entity: entity);
}
