import 'package:flutter/material.dart';
import 'package:true_list/sarthak/Voice%20Message/mic_widget.dart';
import 'package:true_list/sarthak/categories.dart';

import 'Home/home_screen.dart';
import 'Home/home_search.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    switch (settings.name) {
      case '/home_screen':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case '/home_search':
        return MaterialPageRoute(builder: (context) => HomeSearch());
      case '/categories':
        return MaterialPageRoute(builder: (context) => Categories());
      case '/mic_widget':
        return MaterialPageRoute(builder: (context) => MicWidget());
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('ROUTE\n\n$name\n\nNOT FOUND'),
        ),
      ),
    );
    //
    // return  Scaffold(
    //   body: Center(
    //     child: Text('ROUTE\n\n$name\n\nNOT FOUND'),
    //   ),
    // );
  }
}
