import 'package:books_app/data/models/book_model.dart';
import 'package:books_app/presentation/screens/auth_screen/login_screen.dart';
import 'package:books_app/presentation/screens/auth_screen/register_screen.dart';
import 'package:books_app/presentation/screens/home_screen/home_screen.dart';
import 'package:books_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:books_app/presentation/screens/view_details/view_details.dart';
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
        name: 'splash',
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      // Bottom Screen Route
      GoRoute(
        name: 'bottomNav',
        path: '/bottomNav',
        builder: (BuildContext context, GoRouterState state) {
          return BottomNavigationScreen();
        },
      ),
      // Home Screen Route
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      // Register Route
      GoRoute(
        name: 'register',
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return RegisterScreen();
        },
      ),
      // Login Route
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
      ),
      // View Details
      GoRoute(
          name: 'viewDetails',
          path: '/viewDetails',
          pageBuilder: (context, state) {
            final data = state.extra as Map<String, dynamic>;

            final bookModel = data['bookModel'] as BookModel;
            final authorName = data['authorName'] as String;
            final bgColor = data['bgColor'] as Color;
            return MaterialPage(
                child: ViewDetails(
              bookModel: bookModel,
              authorName: authorName,
              bgColor: bgColor,
            ));
          }),
    ],
  );
}
