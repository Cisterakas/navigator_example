import 'package:flutter/material.dart';
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
            // Before: Navigator.push(context, MaterialPageRoute(...)).
            // Now: only the route name is needed; MaterialApp finds the page.
            onClicked: () => Navigator.pushNamed(context, AppRoutes.second),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Replace: Page 2',
            // This is the named-route version of pushReplacement.
            onClicked: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.second),
          ),
          Divider(height: 48),
          ButtonWidget(
            text: 'Push: Page WillPopScope',
            // The page is selected from the route table using its name.
            onClicked: () => Navigator.pushNamed(context, AppRoutes.willPop),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Push: Page PopResult',
            onClicked: () async {
              // Before: MaterialPageRoute constructed PopResultPage directly.
              // Now: arguments carry data to the named route's builder.
              // The routes map creates a dynamic MaterialPageRoute, so do not
              // request a typed Route<String> from pushNamed here.
              final result = await Navigator.pushNamed(
                context,
                AppRoutes.popResult,
                arguments: 'Some data from Page 1',
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
