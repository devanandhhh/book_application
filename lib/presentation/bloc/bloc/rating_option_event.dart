part of 'rating_option_bloc.dart';

abstract class RatingOptionEvent  {
  const RatingOptionEvent();

  List<Object> get props => [];
}
class RatingSubmitEvent extends RatingOptionEvent{
  final String? bookId;
  final int? rating;
  final String? userToken;

  RatingSubmitEvent({required this.bookId, required this.rating, required this.userToken});
}