import 'package:graphql_flutter/graphql_flutter.dart';

abstract class IApiService {
  final String baseUrl;
  final String token;
  final GraphQLClient client;

  IApiService(
      {required this.baseUrl, required this.token, required this.client});
}

class ApiService implements IApiService {
  @override
  String get baseUrl => 'https://humble-clam-46.hasura.app/v1/graphql';

  @override
  String get token => const String.fromEnvironment('api_token');

  @override
  GraphQLClient get client {
    final httpLink = HttpLink(
      baseUrl,
    );

    final authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    Link link = authLink.concat(httpLink);

    return GraphQLClient(link: link, cache: GraphQLCache());
  }
}
