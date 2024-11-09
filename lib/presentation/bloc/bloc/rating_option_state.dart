part of 'rating_option_bloc.dart';

sealed class RatingOptionState extends Equatable {
  const RatingOptionState();
  
  @override
  List<Object> get props => [];
}

final class RatingOptionInitial extends RatingOptionState {}

class RatingLoadingState extends RatingOptionState{

}
class RatingLoadedState extends RatingOptionState{
 final int rating;

  const RatingLoadedState({required this.rating});
  
}
class RatingFaliureState extends RatingOptionState{
  final String error;

 const  RatingFaliureState({required this.error});
}