import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigator_example/page/first_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'Navigator 1.0(Manual Routing)';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
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
    // Manual navigation starts with a widget instead of a route table.
    home: const FirstPage(),
  );
}
