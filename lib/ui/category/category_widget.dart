import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/ui/category/category_tabs_widget.dart';

import '../../core/model/SourcesResponse.dart';
import '../home/category_style.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(category.id),
        builder: (buildContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data \n${snapshot.error}'),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('Server Error \n${snapshot.data?.message}'),
            );
          }
          var sources = snapshot.data?.sources;
          return CategoryTabsWidget(sources!);
        });
  }
}
