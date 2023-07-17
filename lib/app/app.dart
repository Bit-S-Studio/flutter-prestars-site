// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../prestars_exports.dart';

class App extends StatelessWidget {
  final Environment env;
  const App({Key? key, required this.env}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routes = AppRoutes.routes();

    return MaterialApp.router(
      scrollBehavior: MyCustomScrollBehavior(),
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      routerDelegate: routes.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'PRESTARS - conectando clubes e estrelas',
      builder: Asuka.builder,
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: MaterialStateProperty.all<bool>(true),
      )),
    );
  }
}
