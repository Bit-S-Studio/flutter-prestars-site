import 'package:dartz/dartz.dart';

import '../../../../../../prestars_exports.dart';

class AthleteRepositoryImpl extends IAthleteRepository {
  final IAthleteDatasource _datasource;

  AthleteRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, AthleteEntity>> create(
      {required AthleteEntity entity}) async {
    try {
      final result = await _datasource.create(model: entity.toModel);
      return right(result.toEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, AthleteEntity>> update(
      {required String id, required AthleteEntity entity}) async {
    try {
      final result = await _datasource.update(id: id, model: entity.toModel);
      return right(result.toEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, SuccessResponse>> delete({required String id}) async {
    try {
      final result = await _datasource.delete(id: id);
      return right(result);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
