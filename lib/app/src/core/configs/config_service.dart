import '../../../../prestars_exports.dart';

abstract class IConfigsService {
  late String baseUrl;
  late String token;
  late String debugmode;
  late String timeOut;
}

class ConfigsService extends IConfigsService {
  final IEnvironmentService environmentServer;

  ConfigsService({required this.environmentServer});

  @override
  String get baseUrl {
    switch (environmentServer.env) {
      case Environment.prod:
        return 'https://bancodecurriculos.ideas.med.br/api/v1';
      case Environment.qa:
        return 'https://bancodecurriculos.ideas.med.br/api/v1';
      case Environment.dev:
        return 'https://devbancodecurriculos.ideas.med.br/api/v1';
      default:
        return 'https://bancodecurriculos.ideas.med.br/api/v1';
    }
  }
}
