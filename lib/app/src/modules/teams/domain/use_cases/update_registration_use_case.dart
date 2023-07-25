import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

abstract class IUpdateAthleteUseCase {
  Future<Either<Failure, AthleteEntity>> call(
      {required String id, required AthleteEntity entity});
}

class UpdateAthleteUseCaseImpl extends IUpdateAthleteUseCase {
  final IAthleteRepository _repository;

  UpdateAthleteUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, AthleteEntity>> call(
          {required String id, required AthleteEntity entity}) async =>
      await _repository.update(id: id, entity: entity);
}
