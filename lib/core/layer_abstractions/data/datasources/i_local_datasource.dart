abstract class ILocalDataSource<Model> {
  Model getModel();
  Future<void> cacheModel(Model model);
}
