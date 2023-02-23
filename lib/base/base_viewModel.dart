import 'package:flutter/material.dart';

import 'base_navigator.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;
}
