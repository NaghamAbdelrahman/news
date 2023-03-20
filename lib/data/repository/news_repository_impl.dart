import 'package:news/domain/repository/news_repository_contract.dart';

import '../../domain/model/News.dart';

class NewsRepositoryImpl extends NewsRepositoryContract {
  NewsRemoteDataSource dataSource;

  NewsRepositoryImpl(this.dataSource);

  @override
  Future<List<News>?> getNews(
      {String? sourceId, int? page, String? searchWord}) {
    return dataSource.getNews(
        sourceId: sourceId, page: page, searchWord: searchWord);
  }
}


