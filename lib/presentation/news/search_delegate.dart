import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/news/news_viewModel.dart';

import '../../app/dependency_injection.dart';
import '../utils/dialog_utils.dart';
import 'news_item.dart';

class NewsSearchDelegate extends SearchDelegate {
  NewsListViewModel viewModel = NewsListViewModel(injectGetNewsUseCase());

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(appBarTheme: Theme.of(context).appBarTheme);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    viewModel.getNews(searchWord: query);
    return BlocConsumer<NewsListViewModel, NewsListState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ErrorState) {
            DialogUtils.showMessageDialog(context, state.errorMessage,
                posActionTittle: 'Try Again', posAction: () {
              viewModel.getNews();
            }, isDismisable: false);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoadedState) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(state.newsList[index]);
              },
              itemCount: state.newsList.length,
            );
          }
          return Container();
        });
    /*  FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(searchWord: query),
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
        });*/
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('show suggestions'),
    );
  }
}
