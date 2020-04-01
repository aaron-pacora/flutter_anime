import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_anime/core/navigation/page_names.dart';
import 'package:flutter_anime/features/home/presentation/pages/home_page.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    dynamic args = settings.arguments;
    Widget page;
    switch (settings.name) {
      case RECENT_PAGE:
        page = HomePage();
      break;
      default:
        page = HomePage();
    }
    if(Platform.isIOS){
      return CupertinoPageRoute(builder: (context) => page);
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}