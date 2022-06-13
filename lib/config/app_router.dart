import 'package:flutter/material.dart';
import '/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return PrincipalScreen.route();
      // ignore: no_duplicate_case_values
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CreateProjectScreen.routeName:
        return CreateProjectScreen.route();
      // case ProductScreen.routeName:
      //   return ProductScreen.route(product: settings.arguments as Product);
      // case CatalogScreen.routeName:
      //   return CatalogScreen.route(category: settings.arguments as Category);
      case ProjectDetailsScreen.routeName:
        return ProjectDetailsScreen.route();
      case ProjectScreen.routeName:
        return ProjectScreen.route();
      case ProjectsDashboardScreen.routeName:
        return ProjectsDashboardScreen.route();
      case SetAssigneesScreen.routeName:
        return SetAssigneesScreen.route();

      case SelectMembersScreen.routeName:
        return SelectMembersScreen.route();

      case TaskDueDateScreen.routeName:
        return TaskDueDateScreen.route();

      case TasksScreen.routeName:
        return TasksScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
