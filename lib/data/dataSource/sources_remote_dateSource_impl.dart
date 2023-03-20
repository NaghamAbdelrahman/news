import 'dart:io';

import 'package:news/domain/exceptions/connection_error.dart';
import 'package:news/domain/repository/sources_repository_contract.dart';

import '../../domain/exceptions/server_error.dart';
import '../../domain/model/Source.dart';
import '../api/api_manager.dart';

class SourcesRemoteDataSourceImpl extends SourcesRemoteDataSource {
  ApiManager apiManager;

  SourcesRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<Source>?> getSourcesByCategoryId(String categoryId) async {
    try {
      var data = await apiManager.getSources(categoryId);
      if (data.status == 'error') {
        throw ServerError(data.message!, data.code!);
      }
      return data.sources
          ?.map((sourcesDTO) => sourcesDTO.toDomainSource())
          .toList();
    } on HttpException catch (error) {
      throw ConnectionError('Please check internet connection');
    } on IOException catch (error) {
      throw ConnectionError('Please check internet connection');
    }
  }
}

