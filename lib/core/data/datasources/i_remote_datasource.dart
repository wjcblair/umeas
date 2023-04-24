abstract class IRemoteDataSource<Model> {
  Future<Model> getModel(int modelId);
}
