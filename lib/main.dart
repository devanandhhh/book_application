import 'package:books_app/core/app_route.dart';
import 'package:books_app/presentation/bloc/user_login/user_login_bloc.dart';
import 'package:books_app/presentation/bloc/home_fetch/home_fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/auth_details/author_details_bloc.dart';
import 'presentation/bloc/bloc/rating_option_bloc.dart';
import 'presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'presentation/bloc/user_register/user_register_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserRegisterBloc()),
        BlocProvider(create: (context) => PasswordVisibilityCubit()),
        BlocProvider(create: (context) => HomeFetchBloc()),
        BlocProvider(create: (context) => UserLoginBloc()),
        BlocProvider(create: (context) => AuthorDetailsBloc()),
        BlocProvider(create: (context)=>RatingOptionBloc())
      ],
      child: MaterialApp.router(
        title: 'Book Appliacation',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.router,
      ),
    );
  }
}
