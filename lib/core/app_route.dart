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
      GoRoute(
        name: 'bottomNav',
        path: '/bottomNav',
        builder: (BuildContext context, GoRouterState state) {
          return BottomNavigationScreen();
        },
      ),
      // Define your routes here
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'register',
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return RegisterScreen();
        },
      ),
      GoRoute(
          name: 'login',
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },),
      GoRoute(
          name: 'viewDetails',
          path: '/viewDetails',
          pageBuilder: (context, state) {
            final data =state.extra as Map<String,dynamic>;

            final bookModel =data['bookModel'] as BookModel ;
            
            return  MaterialPage(child: ViewDetails(bookModel:bookModel,));
          }),
    ],
  );
}
