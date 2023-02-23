import 'package:flutter/material.dart';
import 'package:news/base/base_state.dart';
import 'package:news/ui/category/category_tabs_widget.dart';
import 'package:news/ui/category/category_viewModel.dart';
import 'package:provider/provider.dart';

import '../home/category_style.dart';

class CategoryWidget extends StatefulWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState
    extends BaseState<CategoryWidget, CategoryWidgetViewModel>
    implements CategoryWidgetNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadNewsSources(widget.category.id);
  }

  @override
  CategoryWidgetViewModel initViewModel() => CategoryWidgetViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryWidgetViewModel>(
        create: (_) => viewModel,
        child: Consumer<CategoryWidgetViewModel>(
            builder: (buildContext, viewModel, _) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.loadNewsSources(widget.category.id);
                      },
                      child: const Text('Try Again'))
                ],
              ),
            );
          } else if (viewModel.sources == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CategoryTabsWidget(viewModel.sources!);
        }));
  }
}
