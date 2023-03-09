import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/exceptions/server_error.dart';
import 'package:news/domain/usecases/getSourcesByCategoryIdUseCase.dart';

import '../../domain/exceptions/connection_error.dart';
import '../../domain/model/Source.dart';

class CategoryViewModel extends Cubit<CategoryWidgetState> {
  GetSourcesByCategoryIdUseCase sourcesUseCase;

  CategoryViewModel(this.sourcesUseCase) : super(LoadingState());

  void loadSources(String categoryID) async {
    emit(LoadingState());
    try {
      var sources = await sourcesUseCase.invoke(categoryID);
      emit(SourcesLoadedState(sources));
    } catch (e) {
      if (e is ConnectionError) {
        emit(ErrorState('Error loading sources'));
      } else if (e is ServerError) {
        emit(ErrorState(e.errorMessage));
      }
    }
  }
}

abstract class CategoryWidgetState {}

class LoadingState extends CategoryWidgetState {}

class ErrorState extends CategoryWidgetState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SourcesLoadedState extends CategoryWidgetState {
  List<Source> sources;

  SourcesLoadedState(this.sources);
}
