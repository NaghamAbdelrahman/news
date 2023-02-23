import 'package:flutter/material.dart';
import 'package:news/base/base_state.dart';
import 'package:news/core/model/Source.dart';
import 'package:news/ui/news/news_item.dart';
import 'package:news/ui/news/news_navigator.dart';
import 'package:news/ui/news/news_viewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends BaseState<NewsList, NewsListViewModel>
    implements NewsNavigator {
  @override
  NewsListViewModel initViewModel() {
    // TODO: implement initViewModel
    return NewsListViewModel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsListViewModel>(
        create: (_) => viewModel,
        child: Consumer<NewsListViewModel>(
          builder: (_, viewModel, __) {
            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  children: [
                    Text(viewModel.errorMessage!),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getNewsBySourceId(widget.source.id!);
                        },
                        child: const Text('Try Again'))
                  ],
                ),
              );
            } else if (viewModel.newsList == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList?.length ?? 0,
            );
          },
        ));
  }
}
