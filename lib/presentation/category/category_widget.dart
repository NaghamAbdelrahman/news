import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/category/category_tabs_widget.dart';
import 'package:news/presentation/category/category_viewModel.dart';
import 'package:news/presentation/category/di.dart';

import '../home/category_style.dart';
import '../utils/dialog_utils.dart';

class CategoryWidget extends StatefulWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  CategoryViewModel viewModel =
      CategoryViewModel(injectGetSourcesByCategoryIdUseCase());

  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryViewModel>(
      create: (_) => viewModel,
      child: BlocConsumer<CategoryViewModel, CategoryWidgetState>(
        listener: (context, state) {
          if (state is ErrorState) {
            DialogUtils.showMessageDialog(context, state.errorMessage,
                posActionTittle: 'Try Again',
                isDismisable: false, posAction: () {
              viewModel.loadSources(widget.category.id);
            });
          }
        },
        listenWhen: (prevState, newState) {
          if (newState is ErrorState) return true;
          return false;
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SourcesLoadedState) {
            return CategoryTabsWidget(state.sources!);
          }
          return Container();
        },
      ),
    );
  }
}
