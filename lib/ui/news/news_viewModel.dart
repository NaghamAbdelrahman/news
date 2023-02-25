import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/api_manager.dart';
import '../../core/model/News.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      var response = await ApiManager.getNews(soureID: sourceId);
      if (response.status == 'error') {
        emit(ErrorState('Server Error \n${response.message}'));
      } else {
        emit(NewsLoadedState(response.articles!));
      }
    } catch (e) {
      emit(ErrorState('Error loading News'));
    }
  }

  void getNewsBySearch(String word) async {
    try {
      var response = await ApiManager.getNews(searchWord: word);
      if (response.status == 'error') {
        emit(ErrorState('Server Error \n${response.message}'));
      } else {
        emit(NewsLoadedState(response.articles!));
      }
    } catch (e) {
      emit(ErrorState('Error loading News'));
    }
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
