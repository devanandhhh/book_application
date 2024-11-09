import 'package:books_app/core/colors.dart';
import 'package:books_app/presentation/bloc/user_register/user_register_bloc.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/already_register.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/auth_button_widget.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/custom_textfield.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/password_field.dart';
import 'package:books_app/presentation/screens/auth_screen/service/validation_service.dart';
import 'package:books_app/presentation/widgets/others.dart';
import 'package:books_app/presentation/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/network_checker/network_checker.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final connectivityService = ConnectivityService();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 108, bottom: 113),
                child: iconContainer(),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "User name",
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
                            .validatePassword(passwordController.text)),
                    kHeight20,
                    PasswordField(
                      controller: confirmController,
                      label: 'Confirm password',
                      hintText: 'Enter your confirm password',
                      validator: (value) => ValidationService()
                          .validateConfirmPassword(
                              passwordController.text, confirmController.text),
                    ),
                    kHeight20,
                    BlocConsumer<UserRegisterBloc, UserRegisterState>(
                      listener: (context, state) {
                        if (state is UserRegisterSuccessState) {
                          //show snakbar
                          showSnackBar(context, 'SuccessFully Register ');
                          //Navigate to BottomNavScreen
                          context.go('/BottomNav');
                        } else if (state is UserAlreadyExistState) {
                          showSnackBar(
                              context,
                              "This username is already taken. Please try a different one",
                              true);
                        }
                      },
                      builder: (context, state) {
                        if (state is UserRegisterLoadingState) {
                          return lottieRegister();
                        }

                        return AuthButtonWidget(
                          text: 'Register',
                          onTap: () async {
                            if (!(connectivityService.isConnected.value)) {
                              // Show alert dialog if no network connection
                              await showNetworkErrorDialog(context);
                            } else if (formKey.currentState!.validate()) {
                              context.read<UserRegisterBloc>().add(
                                    RegisterButtonClickEvent(
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
                  ],
                ),
              ),
              const AlreadyRegisteredWidget()
            ],
          ),
        ),
      ),
    );
  }
}
