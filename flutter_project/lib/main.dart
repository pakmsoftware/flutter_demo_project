import 'package:flutter/material.dart';
import 'package:flutter_project/get_it/service_locator.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.initAllSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cardColor: Colors.teal.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade900,
        ),
        scaffoldBackgroundColor: Colors.teal.shade800,
        colorScheme: const ColorScheme.dark(
          primary: Colors.teal,
        ),
      ),
      routes: Routes.allRoutes,
      home: HomeScreen(),
    );
  }
}
