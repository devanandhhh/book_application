import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:books_app/data/api/author_repo.dart';
import 'package:books_app/data/models/author_model.dart';
import 'package:meta/meta.dart';

part 'author_details_event.dart';
part 'author_details_state.dart';

class AuthorDetailsBloc extends Bloc<AuthorDetailsEvent, AuthorDetailsState> {
  AuthorDetailsBloc() : super(AuthorDetailsInitial()) {
    on<AuthorDetailsGetEvent>(onGetAuthorDetails);
  }

  FutureOr<void> onGetAuthorDetails(AuthorDetailsGetEvent event, Emitter<AuthorDetailsState> emit) async{

    emit(AuthorDetailsLoadingState());
    try {
      List<AuthorModel>? authorList =await AuthorRepoService().getAuthorsDetails();
      log('response from $authorList');
      emit(AuthorDetailsLoadedState(getAuthorList: authorList!));
    } catch (e) {
      log('error on response author -> $e');
      emit(AuthorDetailsFaliureState(error: 'No data'));
    }
  }
}
