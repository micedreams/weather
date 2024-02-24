import 'package:flutter/material.dart';
import 'package:weather_now/app.dart';

import 'details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const App(),
       onGenerateRoute: (RouteSettings settings) => PageRouteBuilder<dynamic>(
        settings: settings,
        pageBuilder: (_, __, ___) {
          return _resolveRouteWidget(settings.name, settings.arguments);
        },
      ),
    );
  }

  static Widget _resolveRouteWidget(String? routeName, dynamic arguments) {
    if ('/Details' == routeName && arguments is DetailsConfig) {
      return Details(config: arguments);
    } else {
      return const App();
    }
  }
}

