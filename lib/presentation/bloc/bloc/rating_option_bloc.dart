import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:books_app/data/api/books_repo.dart';
import 'package:books_app/data/shared_preference/shared_preference.dart';
import 'package:equatable/equatable.dart';

part 'rating_option_event.dart';
part 'rating_option_state.dart';

class RatingOptionBloc extends Bloc<RatingOptionEvent, RatingOptionState> {
  RatingOptionBloc() : super(RatingOptionInitial()) {
   on<RatingSubmitEvent>(onSubmitEvent);
  }

  FutureOr<void> onSubmitEvent(RatingSubmitEvent event, Emitter<RatingOptionState> emit) async{
    emit(RatingLoadingState());
    try{
      String? accessToken =await TokenService().getToken();
     int? responseCode =await  BooksRepoService().addStarRating(event.bookId!, event.rating!, accessToken!);
     if(responseCode!=null){
      print(responseCode);
      if(responseCode==200){
        emit(RatingLoadedState(rating: event.rating!));
      }else{
        emit(const RatingFaliureState(error: 'Error getting rating'));
      }
     }
    }catch(e){
      log(e.toString());
      emit(RatingFaliureState(error: 'error catch'));
    }
  }
}
