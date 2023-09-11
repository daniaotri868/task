import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_task/feature/prodact/presentation/models/all_product.dart';
import '../../../feature/auth/presentation/pages/create_user.dart';
import '../../../feature/auth/presentation/pages/login.dart';
import '../../../feature/auth/presentation/pages/profile.dart';
import '../../../feature/prodact/presentation/pages/details_product.dart';
import '../../../feature/prodact/presentation/pages/get_cart_page.dart';
import '../../../feature/prodact/presentation/pages/show_all_prodact.dart';
import '../../../feature/splash/splash.dart';
import 'router_config.dart';
import 'package:go_router/go_router.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class GRouter {
  static GoRouter get router => _mainRouter;

  static RouterConfiguration get config => _mainConfig;

  static final RouterConfiguration _mainConfig = RouterConfiguration.init();

  static final GoRouter _mainRouter = GoRouter(
    initialLocation: _mainConfig.kRootRoute,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: _mainConfig.kRootRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _builderPage(
              child: const SplashScreen(),
              state: state,
            );
          }),
      GoRoute(
        path: _mainConfig.authRoutes.login,
        name: _mainConfig.authRoutes.login,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child:  LoginScreen(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            path: _mainConfig.authRoutes.createUser,
            name: _mainConfig.authRoutes.createUser,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child: const CreateUser(),
                state: state,
              );
            },
          ),
        ]
      ),
      GoRoute(
        path: _mainConfig.productRoutes.productScreen,
        name: _mainConfig.productRoutes.productScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const ShowAllProduct(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            path: _mainConfig.productRoutes.detailProductScreen,
            name: _mainConfig.productRoutes.detailProductScreen,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child:  DetailsScreen(product: state.extra as AllProduct),
                state: state,
              );
            },
          ),
          GoRoute(
            path: _mainConfig.profileRoutes.profileScreen,
            name: _mainConfig.profileRoutes.profileScreen,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                child: const Profile(),
                state: state,
              );
            },
          ),
          GoRoute(
            path: _mainConfig.productRoutes.getCartScreen,
            name: _mainConfig.productRoutes.getCartScreen,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(

                child:  GetCartScreen(getProduct: state.extra as List<AllProduct>),
                state: state,
              );
            },
          ),
        ]
      ),
    ],
    errorBuilder: (context, state) => Container(),
  );

  static Page<dynamic> _builderPage<T>({required Widget child, required GoRouterState state}) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(child: child, key: state.pageKey);
    } else {
      return MaterialPage<T>(child: child, key: state.pageKey);
    }
  }
}
