import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import '../prestars_exports.dart';

class AppRoutes {
  static GoRouter routes() => GoRouter(
        initialLocation: '/',
        observers: [Asuka.asukaHeroController],
        routes: <GoRoute>[
          GoRoute(
              path: ConstantsRoutes.root,
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              }),
        ],
      );
}
