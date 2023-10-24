// router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:with_gorouter/pages/DetailsScreen.dart';
import 'package:with_gorouter/pages/ScreenA.dart';
import 'package:with_gorouter/pages/ScreenB.dart';
import 'package:with_gorouter/pages/ScreenC.dart';
import 'package:with_gorouter/scaffold_with_navbar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // TODO: 初期場所を指定
  initialLocation: '/a',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        // TODO: ScaffoldWithNavBarを変更
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        // TODO: パスルートを作成
        GoRoute(
          path: '/a',
          builder: (context, state) {
            return const ScreenA();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              // BottomNavBarの上に重ねて表示する場合はparentNavigatorKeyを指定する
              // parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'A');
              },
            ),
          ],
        ),

        GoRoute(
          path: '/b',
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenB();
          },
          routes: <RouteBase>[
            // Displayed on the root Navigator by specifying the
            // [parentNavigatorKey].
            GoRoute(
              path: 'details',
              // BottomNavBarの上に重ねて表示する場合はparentNavigatorKeyを指定する
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'B');
              },
            ),
          ],
        ),

        GoRoute(
          path: '/c',
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenC();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              // BottomNavBarの上に重ねて表示する場合はparentNavigatorKeyを指定する
              // parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'C');
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
