import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import '../prestars_exports.dart';

class AppRoutes {
  static GoRouter routes(GlobalKey<NavigatorState> rootNavigatorKey,
          GlobalKey<NavigatorState> shellNavigatorKey) =>
      GoRouter(
        initialLocation: '/',
        navigatorKey: rootNavigatorKey,
        observers: [Asuka.asukaHeroController],
        routes: [
          // GoRoute(
          //   path: ConstantsRoutes.root,
          //   pageBuilder: (context, state) => RouteTransition(
          //       key: state.pageKey,
          //       child: const SplashPage(),
          //       isTopToBottom: true),
          // ),
          ShellRoute(
              navigatorKey: shellNavigatorKey,
              pageBuilder: (context, state, child) => RouteTransition(
                  key: state.pageKey,
                  child: BasePage(child: child),
                  isTopToBottom: true),
              routes: [
                GoRoute(
                  path: ConstantsRoutes.root,
                  pageBuilder: (context, state) => RouteTransition(
                    key: state.pageKey,
                    child: const HomePage(),
                  ),
                ),
                GoRoute(
                  path: ConstantsRoutes.athletes,
                  pageBuilder: (context, state) => RouteTransition(
                    key: state.pageKey,
                    child: const AthletePage(),
                  ),
                ),
                GoRoute(
                  path: ConstantsRoutes.teams,
                  pageBuilder: (context, state) => RouteTransition(
                    key: state.pageKey,
                    child: const TeamsPage(),
                  ),
                ),
              ])
        ],
      );
}
