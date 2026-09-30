import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigator_example/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'Navigator 1.0 (go_router Example)';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 247, 172, 12),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 247, 172, 12),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    ),
    // GoRouter owns the route table and gives the app URL-aware navigation.
    routerConfig: appRouter,
  );
}
