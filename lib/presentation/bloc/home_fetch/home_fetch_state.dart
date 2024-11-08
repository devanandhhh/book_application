part of 'home_fetch_bloc.dart';

@immutable
class HomeFetchState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeFetchInitial extends HomeFetchState {}

class HomeFetchLoadingState extends HomeFetchState {}

class HomeFetchLoadedState extends HomeFetchState {
  final List<BookModel> bookList;
  final List<String> authorName;

  HomeFetchLoadedState({required this.bookList, required this.authorName});
  @override
  List<Object> get props => [bookList];
}

class HomeFetchFaliureState extends HomeFetchState {
  final String error;

  HomeFetchFaliureState({required this.error});

  @override
  List<Object> get props => [error];
}
class HomeFetchNoResultsState extends HomeFetchState {}

