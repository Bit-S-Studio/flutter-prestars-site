import '../../../../../../prestars_exports.dart';

abstract class IAthleteDatasource {
  Future<AthleteModel> create(
      {required AthleteModel model});
  Future<AthleteModel> update(
      {required String id, required AthleteModel model});
  Future<SuccessResponse> delete({required String id});
}
