part of 'home_fetch_bloc.dart';

@immutable
abstract class HomeFetchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BooksFetchEvent extends HomeFetchEvent {}

class SearchBookEvent extends HomeFetchEvent {
  final String query;

  SearchBookEvent({required this.query});
  @override
  List<Object> get props => [query];
}
