import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notest/feature/notes/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

final key = GlobalKey<NavigatorState>();
// final appRoutes = GoRouter(
//     navigatorKey: key,
//     debugLogDiagnostics: true,
//     initialLocation: '/home',
//     routes: [
//       GoRoute(
//         name: 'home',
//         path: '/home',
//         pageBuilder: (context, state) => MaterialPage(
//           key: state.pageKey,
//           child: const HomeScreen(),
//         ),
//       ),
//       GoRoute(
//         name: 'addupdate',
//         path: '/addupdate',
//         pageBuilder: (context, state) => MaterialPage(
//           key: state.pageKey,
//           child: const AddUpdateNoteScreen(),
//         ),
//       ),
//     ]);
@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: key,
    debugLogDiagnostics: true,
    initialLocation: HomeRoute.path,
    routes: $appRoutes,
  );
}

@TypedGoRoute<HomeRoute>(
    path: HomeRoute.path,
    routes: [TypedGoRoute<AddUpdateRoute>(path: AddUpdateRoute.path)])
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@TypedGoRoute<AddUpdateRoute>(path: AddUpdateRoute.path)
class AddUpdateRoute extends GoRouteData {
  const AddUpdateRoute();
  static const path = 'addUpdate';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddUpdateNoteScreen();
  }
}

class GoNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did push route $route : $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did pop route $route : $previousRoute');
  }
}
