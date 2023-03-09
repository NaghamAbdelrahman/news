import 'package:news/data/repository/sources_repository_impl.dart';
import 'package:news/domain/usecases/getSourcesByCategoryIdUseCase.dart';

GetSourcesByCategoryIdUseCase injectGetSourcesByCategoryIdUseCase() {
  return GetSourcesByCategoryIdUseCase(injectSourcesRepository());
}
