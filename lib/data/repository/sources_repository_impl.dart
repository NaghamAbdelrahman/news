import 'package:news/domain/repository/sources_repository_contract.dart';

import '../../domain/model/Source.dart';

class SourcesRepositoryImpl extends SourcesRepositoryContract {
  SourcesRemoteDataSource dataSource;

  SourcesRepositoryImpl(this.dataSource);

  @override
  Future<List<Source>?> getSourcesByCategoryId(String categoryId) {
    return dataSource.getSourcesByCategoryId(categoryId);
  }
}


