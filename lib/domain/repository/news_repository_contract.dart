import '../model/News.dart';

abstract class NewsRepositoryContract {
  Future<List<News>?> getNews(
      {String? sourceId, int? page, String? searchWord});
}

abstract class NewsRemoteDataSource {
  Future<List<News>?> getNews(
      {String? sourceId, int? page, String? searchWord});
}
