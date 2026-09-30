import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigator_example/app_routes.dart';
import 'package:navigator_example/page/first_page.dart';
import 'package:navigator_example/page/pop_result_page.dart';
import 'package:navigator_example/page/second_page.dart';
import 'package:navigator_example/page/third_page.dart';
import 'package:navigator_example/page/willpop_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'Navigator 1.0 (Named Routes Example)';

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
    // Before named routes, home was assigned directly with: home: FirstPage().
    // Now the app starts from a route name and looks up the page below.
    initialRoute: AppRoutes.home,
    // This table connects each route name to the widget shown for that route.
    routes: {
      AppRoutes.home: (context) => const FirstPage(),
      AppRoutes.second: (context) => const SecondPage(),
      AppRoutes.third: (context) => const ThirdPage(),
      AppRoutes.willPop: (context) => const WillPopScopePage(),
      AppRoutes.popResult: (context) {
        // Named routes pass extra data through RouteSettings.arguments.
        final data =
            ModalRoute.of(context)?.settings.arguments as String? ??
            'No data provided';
        return PopResultPage(data: data);
      },
    },
  );
}
