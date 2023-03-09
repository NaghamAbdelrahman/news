import 'package:news/domain/model/News.dart';
import 'package:news/domain/repository/news_repository_contract.dart';

class GetNewsUseCase {
  NewsRepositoryContract repository;

  GetNewsUseCase(this.repository);

  Future<List<News>?> invoke(
      {String? sourceId, String? searchWord, int? page}) async {
    var newsList = await repository.getNews(
        sourceId: sourceId, page: page, searchWord: searchWord);
    return newsList;
  }
}
