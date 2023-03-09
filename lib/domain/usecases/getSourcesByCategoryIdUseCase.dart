import 'package:news/domain/repository/sources_repository_contract.dart';

class GetSourcesByCategoryIdUseCase {
  SourcesRepositoryContract repository;

  GetSourcesByCategoryIdUseCase(this.repository);

  invoke(String categoryId) async {
    var sources = await repository.getSourcesByCategoryId(categoryId);

    return sources;
  }
}
