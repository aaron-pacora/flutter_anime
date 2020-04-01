import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_anime/core/navigation/route.dart';
import 'package:flutter_anime/app/colors.dart';
import 'package:flutter_anime/injection_container.dart' as ij;

import 'package:flutter_anime/features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ij.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Anime',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        backgroundColor: BACKGROUND_COLOR,
        scaffoldBackgroundColor: BACKGROUND_COLOR,
        brightness: Brightness.dark,
        accentColor: ACCENT_COLOR,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: PRIMARY_COLOR,
        ),
        cursorColor: PRIMARY_COLOR,
        primaryIconTheme: IconThemeData(
          color: WHITE_COLOR
        ),
        accentIconTheme: IconThemeData(
          color: ACCENT_COLOR
        ),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      home: HomePage()
    );
  }
}