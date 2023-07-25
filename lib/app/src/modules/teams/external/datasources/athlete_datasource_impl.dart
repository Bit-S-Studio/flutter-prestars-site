import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../../prestars_exports.dart';

class AthleteDatasourceImpl extends IAthleteDatasource {
  final IApiService apiService;

  AthleteDatasourceImpl({required this.apiService});

  @override
  Future<AthleteModel> create({required AthleteModel model}) async {
    final result = await apiService.client.mutate(
      MutationOptions(
        document: gql(AthleteOption.mutationString),
        variables: model.toJson(),
      ),
    );
    if (result.data != null) {
      return model;
    } else {
      throw const ErrorResponse(message: 'falhou');
    }
  }

  @override
  Future<SuccessResponse> delete({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<AthleteModel> update(
      {required String id, required AthleteModel model}) {
    throw UnimplementedError();
  }
}
