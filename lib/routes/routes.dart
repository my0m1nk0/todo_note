import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_model.dart';

import '../pages/edit_task_page.dart';
import '../pages/home_page.dart';
import '../pages/new_task_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/new_task':
        return MaterialPageRoute(
          builder: (_) => const NewTaskPage(),
          settings: settings,
        );
      case '/edit_task': // Add this case
        return MaterialPageRoute(
          builder: (_) => EditPage(todo: settings.arguments as TodoModel),
        );
      default:
        // If the route is not defined, you can handle it here
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404: Route not found!'),
            ),
          ),
        );
    }
  }
}
