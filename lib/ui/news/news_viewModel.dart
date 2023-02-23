import 'package:news/base/base_viewModel.dart';
import 'package:news/core/api/api_manager.dart';

import '../../core/model/News.dart';
import 'news_navigator.dart';

class NewsListViewModel extends BaseViewModel<NewsNavigator> {
  String? errorMessage;
  List<News>? newsList;

  void getNewsBySourceId(String sourceId) async {
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNews(soureID: sourceId);
      if (response.status == 'error') {
        errorMessage = 'Server Error \n${response.message}';
      }
      newsList = response.articles!;
    } catch (e) {
      errorMessage = 'error loading news';
    }
    notifyListeners();
  }
}
