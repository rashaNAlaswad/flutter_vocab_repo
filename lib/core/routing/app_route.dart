import 'package:flutter/material.dart';
import 'routes.dart';
import '../../model/word.dart';

import '../../view/screens/home/home_screen.dart';
import '../../view/screens/details/word_details_screen.dart';

class AppRoute {
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.details:
        final word = settings.arguments as Word;
        return MaterialPageRoute(
          builder: (_) => WordDetailsScreen(
            word: word,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text('Page not found'),
          ),
        );
    }
  }
}
