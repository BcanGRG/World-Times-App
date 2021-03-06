import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:world_times_app/core/theme/themeDatas.dart';
import 'package:world_times_app/core/theme/theme_provider.dart';
import 'package:world_times_app/feature/main/view/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization();
  runApp(const MyApp());
}

//* Splash açılırken 3 saniyelik bekletme
Future initialization() async {
  await Future.delayed(Duration(seconds: 3));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'World Times',
          themeMode: themeProvider.themeMode,
          theme: ThemeDatas.lightTheme,
          darkTheme: ThemeDatas.darkTheme,
          home: MainView(),
        );
      },
    );
  }
}
