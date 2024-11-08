import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:books_app/data/api/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/shared_preference/shared_preference.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial()) {
    on<UserLoginButtonClickEvent>(onUserLoginSubmitted);
  }

  FutureOr<void> onUserLoginSubmitted(
      UserLoginButtonClickEvent event, Emitter<UserLoginState> emit) async {
    emit(UserLoginLoadingState());
    try {
      final response =
          await AuthRepoService().userLogin(event.name, event.password);
      log('respone =>$response');
      if (response != null && response.statusCode == 201) {
        //get accessToken
        final String accessToken =
            jsonDecode(response.body)['result']['access_token'];
        //Store the token in Shared preference
        TokenService().saveToken(accessToken: accessToken);
        //emit Success State
        emit(UserLoginSuccessState());
      } else if (response != null && response.statusCode == 404) {
        //emit UserAlreadyExistState State
        final String message = jsonDecode(response.body)['message'];
        emit(UserLoginNotExistState(message: message));
      } else if (response != null && response.statusCode == 400) {
        emit(UserLoginFaliureState(error: '400 found'));
      }
    } catch (e) {
      log('Error $e');
      emit(UserLoginFaliureState(error: 'Faliure'));
    }
  }
}
