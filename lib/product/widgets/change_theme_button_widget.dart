import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/core/theme/theme_provider.dart';
import 'package:world_times_app/product/utils/assets_constants.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashRadius: 25,
        icon: themeProvider.isDarkMode
            ? Image.asset(AssetsConstants.sunIcon)
            : Image.asset(AssetsConstants.moonIcon),
        onPressed: () async {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          themeProvider.isDarkMode
              ? provider.toogleTheme(false)
              : provider.toogleTheme(true);
        },
      ),
    );
  }
}
