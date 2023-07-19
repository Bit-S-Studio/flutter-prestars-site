import 'package:image_picker/image_picker.dart';

abstract class IStorageDatasource {
  Future<String> call({required XFile file});
}
