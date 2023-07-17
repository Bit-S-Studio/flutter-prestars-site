abstract class IStorageDatasource {
  Future<String> call({required String path, required String name});
}
