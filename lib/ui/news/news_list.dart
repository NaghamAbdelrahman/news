import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/model/Source.dart';
import 'package:news/ui/news/news_item.dart';
import 'package:news/ui/news/news_viewModel.dart';
import 'package:news/utils/dialog_utils.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsListViewModel viewModel = NewsListViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNewsBySourceId(widget.source.id!);
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
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(state.newsList[index]);
              },
              itemCount: state.newsList.length,
            );
          }
          return Container();
        });
  }
}