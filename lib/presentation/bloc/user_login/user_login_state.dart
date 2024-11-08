part of 'user_login_bloc.dart';

@immutable
abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class UserLoginLoadingState extends UserLoginState {}

class UserLoginSuccessState extends UserLoginState {}

class UserLoginFaliureState extends UserLoginState{
  final String error;

  UserLoginFaliureState({required this.error});
}

class UserLoginNotExistState extends UserLoginState{
  final String message ;

  UserLoginNotExistState({required this.message});
  
}