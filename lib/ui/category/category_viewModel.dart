import 'package:news/base/base_navigator.dart';
import 'package:news/base/base_viewModel.dart';

import '../../core/api/api_manager.dart';
import '../../core/model/Source.dart';

class CategoryWidgetViewModel extends BaseViewModel<CategoryWidgetNavigator> {
  List<Source>? sources;
  String? errorMessage;

  void loadNewsSources(String categoryId) async {
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        errorMessage = 'Server Error \n${response.message}';
      }
      sources = response.sources;
    } catch (e) {
      errorMessage = 'error getting news sources';
    }
    notifyListeners();
  }
}

abstract class CategoryWidgetNavigator extends BaseNavigator {}
