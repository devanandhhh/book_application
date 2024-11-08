import 'package:books_app/core/app_route.dart';
import 'package:books_app/presentation/bloc/user_login/user_login_bloc.dart';
import 'package:books_app/presentation/bloc/home_fetch/home_fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/auth_details/author_details_bloc.dart';
import 'presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'presentation/bloc/user_register/user_register_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserRegisterBloc()),
        BlocProvider(create: (context) => PasswordVisibilityCubit()),
        BlocProvider(create: (context) => HomeFetchBloc()),
        BlocProvider(create: (context) => UserLoginBloc()),
        BlocProvider(create: (context)=>AuthorDetailsBloc())
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',

        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.router,
        //home: const SplashScreen(),
      ),
    );
  }
}
