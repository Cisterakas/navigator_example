import 'package:flutter/material.dart';
import 'package:navigator_example/app_routes.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/widget/button_widget.dart';
import 'package:navigator_example/widget/header_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(MyApp.title), centerTitle: true),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HeaderWidget(title: 'Page 2'),
          ButtonWidget(
            text: 'Push: Page 3',
            // Before: this button created ThirdPage with MaterialPageRoute.
            // Now: the route table resolves the page from this name.
            onClicked: () => Navigator.pushNamed(context, AppRoutes.third),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Pop: Page 1',
            onClicked: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}
