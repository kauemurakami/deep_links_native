import 'package:deeplink_native/app/modules/home/controller.dart';
import 'package:deeplink_native/app/modules/home/home.dart';
import 'package:deeplink_native/app/modules/initial/controller.dart';
import 'package:deeplink_native/app/modules/initial/page.dart';
import 'package:deeplink_native/routes/transitions/fade_transition.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:minimals_state_manager/app/provider/min_provider.dart';

abstract class GoRootDelegate {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    initialLocation: '/initial',
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) => '/login',
      ),
      GoRoute(
        name: 'initial',
        path: '/initial',
        pageBuilder: (BuildContext context, GoRouterState state) {
          print('initial login ${state.fullPath}' ?? '');
          return CustomFadeTransition(
            child: MinProvider(
              controller: InitialController(),
              child: const InitialPage(),
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'home',
            path: 'home',
            pageBuilder: (BuildContext context, GoRouterState state) {
              print('going signup ${state.fullPath}' ?? '');
              return CustomFadeTransition(
                child: MinProvider(
                  controller: HomeController(),
                  child: const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );
}
