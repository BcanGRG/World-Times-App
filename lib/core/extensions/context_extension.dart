import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  Size get dynamicSize => MediaQuery.of(this).size;
  double get getHeight => MediaQuery.of(this).size.height;
  double get getWidth => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
}
