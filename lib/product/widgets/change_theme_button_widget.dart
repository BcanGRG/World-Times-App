import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_times_app/core/theme/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode ? true : false,
      onChanged: (value) async {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toogleTheme(value);
      },
    );
  }
}
