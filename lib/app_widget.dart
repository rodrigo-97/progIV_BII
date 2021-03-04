import 'package:flutter/material.dart';
import 'package:progIV_BII/app_controller.dart';
import 'package:progIV_BII/home_page.dart';
import 'package:progIV_BII/login_page.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.purple,
            // brightness: AppController.instance.switchValue
            //     ? Brightness.dark
            //     : Brightness.light,
            brightness: Brightness.dark,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
