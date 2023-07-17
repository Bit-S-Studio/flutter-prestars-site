import 'dart:js_interop';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../../prestars_exports.dart';

class AthleteDatasourceImpl extends IAthleteDatasource {
  final IApiService apiService;

  AthleteDatasourceImpl({required this.apiService});

  @override
  Future<AthleteModel> create({required AthleteModel model}) async {
    final mutation = await apiService.client.mutate(
      MutationOptions(
        document: gql(AthleteOption.mutationString),
        variables: {'createAthleteInput': model.toJson()},
      ),
    );
    if (mutation.data.isDefinedAndNotNull) {
      print(mutation.data);
    }
    throw UnimplementedError();
  }

  @override
  Future<SuccessResponse> delete({required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<AthleteModel> update(
      {required String id, required AthleteModel model}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
