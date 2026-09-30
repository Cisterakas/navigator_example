import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_example/app_routes.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/widget/button_widget.dart';
import 'package:navigator_example/widget/header_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    appBar: AppBar(title: Text(MyApp.title), centerTitle: true),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderWidget(title: 'Page 1'),
          ButtonWidget(
            text: 'Push: Page 2',
            // push adds a page to the navigation stack.
            onClicked: () => context.push(AppRoutes.second),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Replace: Page 2',
            // pushReplacement replaces the current page in the stack.
            onClicked: () => context.pushReplacement(AppRoutes.second),
          ),
          Divider(height: 48),
          ButtonWidget(
            text: 'Push: Page WillPopScope',
            onClicked: () => context.push(AppRoutes.willPop),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Push: Page PopResult',
            onClicked: () async {
              // extra passes data to the GoRoute builder.
              final result = await context.push<String>(
                AppRoutes.popResult,
                extra: 'Some data from Page 1',
              );

              if (!context.mounted) return;
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('Got result: $result')));
            },
          ),
        ],
      ),
    ),
  );
}
