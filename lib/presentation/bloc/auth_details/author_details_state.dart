part of 'author_details_bloc.dart';

@immutable
abstract class AuthorDetailsState {}

class AuthorDetailsInitial extends AuthorDetailsState {}

class AuthorDetailsLoadingState extends AuthorDetailsState {}

class AuthorDetailsLoadedState extends AuthorDetailsState {
  final List<AuthorModel> getAuthorList;

  AuthorDetailsLoadedState({required this.getAuthorList});
}
class AuthorDetailsFaliureState extends AuthorDetailsState{
  final String error;

  AuthorDetailsFaliureState({required this.error});
  
}