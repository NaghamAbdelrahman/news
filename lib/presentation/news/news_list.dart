import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/news/di.dart';
import 'package:news/presentation/news/news_item.dart';
import 'package:news/presentation/news/news_viewModel.dart';

import '../../domain/model/News.dart';
import '../../domain/model/Source.dart';
import '../utils/dialog_utils.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsListViewModel viewModel = NewsListViewModel(injectGetNewsUseCase());
  List<News> news = [];
  final scrollController = ScrollController();
  bool shouldLoadingNextPage = false;
  int pageNum = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          shouldLoadingNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldLoadingNextPage) {
      viewModel
          .getNews(sourceId: widget.source.id, page: ++pageNum)
          .then((newsResponse) => news.addAll(newsResponse!));
      shouldLoadingNextPage = false;
      setState(() {});
    }
    viewModel.getNews(sourceId: widget.source.id!);
    return BlocConsumer<NewsListViewModel, NewsListState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ErrorState) {
            DialogUtils.showMessageDialog(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoadedState) {
            if (news.isEmpty) {
              news = state.newsList;
            } else if (state.newsList[0] != news[0]) {
              scrollController.jumpTo(0);
              news = state.newsList;
            }
            return ListView.builder(
              controller: scrollController,
              itemBuilder: (_, index) {
                return NewsItem(news[index]);
              },
              itemCount: news.length,
            );
          }
          return Container();
        });
  }
}
