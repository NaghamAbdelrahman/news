import 'package:flutter/material.dart';

import '../utils/dialog_utils.dart';
import 'base_navigator.dart';
import 'base_viewModel.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void showMessageDialog(String message,
      {String? posActionTittle,
      String? negActionTittle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      bool isDismisable = true}) {
    DialogUtils.showMessageDialog(context, message,
        posActionTittle: posActionTittle,
        negActionTittle: negActionTittle,
        posAction: posAction,
        negAction: negAction,
        isDismisable: isDismisable);
  }

  @override
  void showProgressDialog(String message, {bool isDismisable = true}) {
    DialogUtils.showProgressDialog(context, message,
        isDismisable: isDismisable);
  }

  @override
  void hideDialog() {
    DialogUtils.hideDialog(context);
  }
}
