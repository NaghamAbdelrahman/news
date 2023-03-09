import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/exceptions/connection_error.dart';
import '../../domain/exceptions/server_error.dart';
import '../../domain/model/News.dart';
import '../../domain/usecases/getNewsUseCase.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  GetNewsUseCase newsUseCase;

  NewsListViewModel(this.newsUseCase) : super(LoadingState());

  Future<List<News>?> getNews(
      {String? sourceId, int? page, String? searchWord}) async {
    List<News>? newsList;
    try {
      newsList = await newsUseCase.invoke(
          sourceId: sourceId, page: page, searchWord: searchWord);
      emit(NewsLoadedState(newsList!));
    } catch (e) {
      if (e is ConnectionError) {
        emit(ErrorState('Error loading news'));
      } else if (e is ServerError) {
        emit(ErrorState(e.errorMessage));
      }
    }
    return newsList;
  }
}

abstract class NewsListState {}

class LoadingState extends NewsListState {}

class ErrorState extends NewsListState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class NewsLoadedState extends NewsListState {
  List<News> newsList;

  NewsLoadedState(this.newsList);
}
