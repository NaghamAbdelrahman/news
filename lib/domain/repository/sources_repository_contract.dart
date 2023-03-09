import '../model/Source.dart';

abstract class SourcesRepositoryContract {
  Future<List<Source>?> getSourcesByCategoryId(String categoryId);
}

abstract class SourcesRemoteDataSource {
  Future<List<Source>?> getSourcesByCategoryId(String categoryId);
}
