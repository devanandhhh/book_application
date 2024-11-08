import 'package:books_app/core/colors.dart';
import 'package:books_app/presentation/bloc/user_login/user_login_bloc.dart';
import 'package:books_app/presentation/screens/auth_screen/service/validation_service.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/auth_button_widget.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/custom_textfield.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/password_field.dart';
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 108, bottom: 113),
                  child: iconContainer(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: 'User name',
                      hintText: 'Enter your name',
                      controller: nameController,
                      validator: (value) =>
                          ValidationService().validateName(nameController.text),
                    ),
                    kHeight20,
                    PasswordField(
                      controller: passwordController,
                      label: 'Password',
                      hintText: 'Enter your password',
                      validator: (value) => ValidationService()
                          .validatePassword(passwordController.text),
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

                        return AuthButtonWidget(
                          text: 'Login',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<UserLoginBloc>().add(
                                    UserLoginButtonClickEvent(
                                      name: nameController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                            }
                          },
                        );
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
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: kOrange),
                          ),
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
