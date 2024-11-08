import 'package:books_app/core/colors.dart';
import 'package:books_app/presentation/bloc/user_login/user_login_bloc.dart';
import 'package:books_app/presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'package:books_app/presentation/screens/auth_screen/register_screen.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/validation_service.dart';
import 'package:books_app/presentation/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/others.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 108, bottom: 113),
                  child: iconContainer(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //user name
                    Text(
                      'User Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kGrey600),
                    ),
                    kHeight10,
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Enter your name',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kOrange, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) =>
                          ValidationService().validateName(nameController.text),
                    ),
                    kHeight20,
                    //password
                    Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kGrey600),
                    ),
                    kHeight10,
                    BlocBuilder<PasswordVisibilityCubit,
                        PasswordVisibilityState>(
                      builder: (context, state) {
                        if (state is PasswordVisibilityInitial) {
                          return TextFormField(
                            controller: passwordController,
                            obscureText: state.isVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Enter your password',
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: kOrange, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state.isVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: kGrey600,
                                ),
                                onPressed: () {
                                  context
                                      .read<PasswordVisibilityCubit>()
                                      .toggleVisibility();
                                },
                              ),
                            ),
                            validator: (value) => ValidationService()
                                .validatePassword(passwordController.text),
                          );
                        } else {
                          return kHeight10;
                        }
                      },
                    ),

                    kHeight20,
                    kHeight20,
                    BlocConsumer<UserLoginBloc, UserLoginState>(
                      listener: (context, state) {
                        if (state is UserLoginSuccessState) {
                          showSnackBar(context, 'SuccessFully Login ');
                          context.go('/BottomNav');
                        } else if (state is UserLoginNotExistState) {
                          showSnackBar(context,
                              "Username not found. Please register or try another username.");
                        } else if (state is UserLoginFaliureState) {
                          showSnackBar(context,
                              "Something went wrong , Try again after sometime");
                        }
                      },
                      builder: (context, state) {
                        if (state is UserLoginLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                context.read<UserLoginBloc>().add(
                                    UserLoginButtonClickEvent(
                                        name: nameController.text,
                                        password: passwordController.text));
                              }
                            },
                            child: authButton("LogIn"));
                      },
                    ),
                    kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('New User Registration?'),
                        TextButton(
                          onPressed: () {
                            context.pushNamed('register');
                          },
                          child: const Text('Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: kOrange)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
