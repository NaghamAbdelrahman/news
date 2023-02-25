import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/api/api_manager.dart';

import '../../core/model/Source.dart';

class CategoryViewModel extends Cubit<CategoryWidgetState> {
  CategoryViewModel() : super(LoadingState());

  void loadSources(String categoryID) async {
    emit(LoadingState());
    try {
      var response = await ApiManager.getSources(categoryID);
      if (response.status == 'error') {
        emit(ErrorState('Server Error \n${response.message}'));
      } else {
        emit(SourcesLoadedState(response.sources!));
      }
    } catch (e) {
      emit(ErrorState('Error loading sources'));
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
