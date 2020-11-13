import 'package:flutter/material.dart';
import '../pages/pages.dart';

enum RouterPath {
  animatedContainer,
  animatedOpacity,
  initial,
}

extension RouterString on RouterPath {
  String get string {
    switch (this) {
      case RouterPath.initial:
        return "/";
      default:
        return this.toString().split(".").last;
    }
  }
}

Map<String, WidgetBuilder> generateRouters() {
  final result = _generateRouters();
  Map<String, WidgetBuilder> item = {};
  result.forEach((key, value) {
    item[key.string] = value;
  });
  return item;
}

Map<RouterPath, WidgetBuilder> _generateRouters() {
  return {
    RouterPath.animatedContainer: (context) => AnimatedContainerPage(),
    RouterPath.initial: (context) => MainPage(),
    RouterPath.animatedOpacity: (context) => AnimatedOpacityPage(),
  };
}
