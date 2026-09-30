import 'package:flutter/material.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/page/pop_result_page.dart';
import 'package:navigator_example/page/second_page.dart';
import 'package:navigator_example/page/willpop_page.dart';
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
            // MaterialPageRoute constructs the destination when the button is tapped.
            onClicked: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            ),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Replace: Page 2',
            // pushReplacement removes Page 1 before adding Page 2.
            onClicked: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            ),
          ),
          Divider(height: 48),
          ButtonWidget(
            text: 'Push: Page WillPopScope',
            // Each destination is created directly by this navigation callback.
            onClicked: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WillPopScopePage()),
            ),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Push: Page PopResult',
            onClicked: () async {
              // push returns a Future that completes when the new page pops.
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PopResultPage(data: 'Some data from Page 1'),
                ),
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
