abstract class ILocalDataSource<Model> {
  Future<Model> getModel();
  Future<void> cacheModel(Model model);
}
