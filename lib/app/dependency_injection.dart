import '../data/api/api_manager.dart';
import '../data/dataSource/news_remote_data_source_impl.dart';
import '../data/dataSource/sources_remote_dateSource_impl.dart';
import '../data/repository/news_repository_impl.dart';
import '../data/repository/sources_repository_impl.dart';
import '../domain/repository/news_repository_contract.dart';
import '../domain/repository/sources_repository_contract.dart';
import '../domain/usecases/getNewsUseCase.dart';
import '../domain/usecases/getSourcesByCategoryIdUseCase.dart';

SourcesRemoteDataSource injectSourcesDataSource() {
  return SourcesRemoteDataSourceImpl(ApiManager.getInstance());
}

SourcesRepositoryContract injectSourcesRepository() {
  return SourcesRepositoryImpl(injectSourcesDataSource());
}

GetSourcesByCategoryIdUseCase injectGetSourcesByCategoryIdUseCase() {
  return GetSourcesByCategoryIdUseCase(injectSourcesRepository());
}

NewsRemoteDataSource injectNewsDataSource() {
  return NewsRemoteDataSourceImpl(ApiManager.getInstance());
}

NewsRepositoryContract injectNewsRepository() {
  return NewsRepositoryImpl(injectNewsDataSource());
}

GetNewsUseCase injectGetNewsUseCase() {
  return GetNewsUseCase(injectNewsRepository());
}
