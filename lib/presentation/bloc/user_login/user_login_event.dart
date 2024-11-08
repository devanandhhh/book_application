part of 'user_login_bloc.dart';

@immutable
abstract class UserLoginEvent {}

class UserLoginButtonClickEvent extends UserLoginEvent{
  final String name;
  final String password;

  UserLoginButtonClickEvent({required this.name, required this.password});
}
