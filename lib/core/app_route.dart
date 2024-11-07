import 'package:books_app/presentation/screens/auth_screen/register_screen.dart';
import 'package:books_app/presentation/screens/home_screen/home_screen.dart';
import 'package:books_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/bottom_nav/botton_nav.dart';

class AppRouter {
  // Set up routes using GoRouter
  final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      // Splash Screen Route
      GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/bottomNav',
        builder: (BuildContext context, GoRouterState state) {
          return BottomNavigationScreen();
        },
      ),
      // Define your routes here
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return RegisterScreen();
        },
      ),
    ],
  );
}
