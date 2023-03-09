import 'dart:io';

import 'package:news/domain/exceptions/server_error.dart';
import 'package:news/domain/repository/news_repository_contract.dart';

import '../../domain/exceptions/connection_error.dart';
import '../../domain/model/News.dart';
import '../api/api_manager.dart';

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<News>?> getNews(
      {String? sourceId, int? page, String? searchWord}) async {
    try {
      var newsList = await apiManager.getNews(
          sourceID: sourceId, page: page, searchWord: searchWord);
      if (newsList.status == 'error') {
        throw ServerError(newsList.message!, newsList.code!);
      }
      return newsList.articles
          ?.map((newsDTO) => newsDTO.toDomainNews())
          .toList();
    } on HttpException catch (error) {
      throw ConnectionError('Please check internet connection');
    } on IOException catch (error) {
      throw ConnectionError('Please check internet connection');
    }
  }
}

NewsRemoteDataSource injectNewsDataSource() {
  return NewsRemoteDataSourceImpl(ApiManager.getInstance());
}
