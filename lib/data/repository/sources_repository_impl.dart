import 'package:news/data/dataSource/sources_remote_dateSource_impl.dart';
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

SourcesRepositoryContract injectSourcesRepository() {
  return SourcesRepositoryImpl(injectSourcesDataSource());
}
