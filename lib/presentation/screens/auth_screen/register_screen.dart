import 'package:books_app/core/colors.dart';
import 'package:books_app/presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'package:books_app/presentation/bloc/user_register/user_register_bloc.dart';
import 'package:books_app/presentation/screens/auth_screen/widgets/validation_service.dart';
import 'package:books_app/presentation/widgets/icon_widget.dart';
import 'package:books_app/presentation/widgets/others.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          )),
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
                        PasswordVisibilityState>(builder: (context, state) {
                      if (state is PasswordVisibilityInitial) {
                        return TextFormField(
                          controller: passwordController,
                          obscureText: state.isVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Enter your password',
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: kOrange, width: 2.0),
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
                    }),
                    kHeight20,
                    //confirm password
                    Text(
                      'Confirm password',
                      style: TextStyle(
                          color: kGrey600, fontWeight: FontWeight.bold),
                    ),
                    kHeight10,
                    BlocBuilder<PasswordVisibilityCubit,
                        PasswordVisibilityState>(builder: (context, state) {
                      if (state is PasswordVisibilityInitial) {
                        return TextFormField(
                          controller: confirmController,
                          obscureText: state.isVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Enter your confirm password',
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: kOrange, width: 2.0),
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
                              .validateConfirmPassword(passwordController.text,
                                  confirmController.text),
                        );
                      } else {
                        return kHeight10;
                      }
                    }),
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
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                context.read<UserRegisterBloc>().add(
                                    RegisterButtonClickEvent(
                                        name: nameController.text,
                                        password: passwordController.text));
                              }
                            },
                            child: authButton("Register"));
                      },
                    ),
                    kHeight20
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container authButton(String? text) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: Colors.orange[800],
    ),
    child: Center(
        child: Text(
      text!,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
    )),
  );
}
