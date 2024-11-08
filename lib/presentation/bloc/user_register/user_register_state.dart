part of 'user_register_bloc.dart';

@immutable
abstract class UserRegisterState {}

class UserRegisterInitial extends UserRegisterState {}

class UserRegisterLoadingState extends UserRegisterState {}

class UserRegisterSuccessState extends UserRegisterState {}

class UserRegisterFaliureState extends UserRegisterState {
  final String error;
  UserRegisterFaliureState(this.error);
}

class UserAlreadyExistState extends UserRegisterState {
  final String message;

  UserAlreadyExistState({required this.message});
}
