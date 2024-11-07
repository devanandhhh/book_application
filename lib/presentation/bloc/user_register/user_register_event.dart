part of 'user_register_bloc.dart';

@immutable
abstract class UserRegisterEvent {}

class RegisterButtonClickEvent extends UserRegisterEvent {
  final String name;
  final String password;
  RegisterButtonClickEvent({required this.name, required this.password});
}
