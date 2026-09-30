import 'package:go_router/go_router.dart';
import 'package:navigator_example/app_routes.dart';
import 'package:navigator_example/page/first_page.dart';
import 'package:navigator_example/page/pop_result_page.dart';
import 'package:navigator_example/page/second_page.dart';
import 'package:navigator_example/page/third_page.dart';
import 'package:navigator_example/page/willpop_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: AppRoutes.second,
      builder: (context, state) => const SecondPage(),
    ),
    GoRoute(
      path: AppRoutes.third,
      builder: (context, state) => const ThirdPage(),
    ),
    GoRoute(
      path: AppRoutes.willPop,
      builder: (context, state) => const WillPopScopePage(),
    ),
    GoRoute(
      path: AppRoutes.popResult,
      builder: (context, state) {
        final data = state.extra as String? ?? 'No data provided';
        return PopResultPage(data: data);
      },
    ),
  ],
);
