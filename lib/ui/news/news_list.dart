import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/model/NewsResponse.dart';
import 'package:news/core/model/Source.dart';
import 'package:news/ui/news/news_item.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(soureID: source.id),
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
          var newsList = snapshot.data?.articles;
          return ListView.builder(
            itemBuilder: (_, index) {
              return NewsItem(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        });
  }
}
