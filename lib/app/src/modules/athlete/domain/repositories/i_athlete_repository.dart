import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

abstract class IAthleteRepository {
  Future<Either<Failure, AthleteEntity>> create(
      {required AthleteEntity entity});
  Future<Either<Failure, AthleteEntity>> update(
      {required String id, required AthleteEntity entity});
  Future<Either<Failure, SuccessResponse>> delete({required String id});
}
