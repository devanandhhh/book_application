import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:books_app/data/api/auth_repo.dart';
import 'package:books_app/data/shared_preference/shared_preference.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'user_register_event.dart';
part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterBloc() : super(UserRegisterInitial()) {
    on<RegisterButtonClickEvent>(onUserRegisterSubmitted);
  }

  FutureOr<void> onUserRegisterSubmitted(
      RegisterButtonClickEvent event, Emitter<UserRegisterState> emit) async {
    emit(UserRegisterLoadingState());
    try {
      Response? response =
          await AuthRepoService().userRegister(event.name, event.password);
      log('response $response');
      if (response != null && response.statusCode == 201) {
        //get accessToken
        final String accessToken =
            jsonDecode(response.body)['result']['access_token'];
        //Store the token in Shared preference
        TokenService().saveToken(accessToken: accessToken);
        //emit Success State
        emit(UserRegisterSuccessState());
      } else if (response != null && response.statusCode == 400) {
        //emit UserAlreadyExistState State
        final String message = jsonDecode(response.body)['message'];
        emit(UserAlreadyExistState(message: message));
      }
    } catch (e) {
      log('Error $e');
      emit(UserRegisterFaliureState('Faliure'));
    }
  }
}
