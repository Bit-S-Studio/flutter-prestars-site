

import '../../../../../../prestars_exports.dart';

abstract class IAddressDatasource {
  Future<AddressModel> call({required String cep});
}
