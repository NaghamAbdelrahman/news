import 'package:news/data/repository/news_repository_impl.dart';
import 'package:news/domain/usecases/getNewsUseCase.dart';

GetNewsUseCase injectGetNewsUseCase() {
  return GetNewsUseCase(injectNewsRepository());
}
