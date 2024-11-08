import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:books_app/data/api/books_repo.dart';
import 'package:books_app/data/models/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_fetch_event.dart';
part 'home_fetch_state.dart';

class HomeFetchBloc extends Bloc<HomeFetchEvent, HomeFetchState> {
  List<BookModel> allBooks = [];
  List<String> allAuthors = [];

  HomeFetchBloc() : super(HomeFetchInitial()) {
    on<BooksFetchEvent>(onBookFetchEvent);
    on<SearchBookEvent>(onSearchBookFecth);
  }

  FutureOr<void> onBookFetchEvent(
      BooksFetchEvent event, Emitter<HomeFetchState> emit) async {
    emit(HomeFetchLoadingState());
    try {
      List<BookModel>? getBookList =
          await BooksRepoService().fetchBookFromApi(limit: 10, page: 1);
      List<String> authorNames =
          await Future.wait(getBookList!.map((book) async {
        return await BooksRepoService().getAuthorName(authorId: book.authorId);
      }));
      allBooks = getBookList;
      allAuthors = authorNames;
      emit(HomeFetchLoadedState(bookList: allBooks, authorName: allAuthors));
    } catch (e) {
      log('Error in Onbookfetch=>$e');
    }
  }

  FutureOr<void> onSearchBookFecth(
      SearchBookEvent event, Emitter<HomeFetchState> emit) async {
    log('on search on going ${emit.isDone.toString()}');
    //if (emit.isDone) return;
    if (event.query.isEmpty) {
      // If query is empty, show all books
      HomeFetchLoadedState(bookList: allBooks, authorName: allAuthors);
      log("Emit all books (query is empty). Count: ${allBooks.length}"); //
    } else {
      final filteredBooks = allBooks
          .where((book) =>
              book.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      final filteredAuthor = allAuthors
          .where(
              (author) => filteredBooks.any((book) => book.authorId == author))
          .toList();

      // emit(HomeFetchLoadedState(
      //     bookList: filteredBooks, authorName: filteredAuthor));
      //      print("Emit filtered books. Count: ${filteredBooks.length}"); // Debugging line
      //
      if (filteredBooks.isEmpty) {
        // No matching books found, emit No Results State
        emit(HomeFetchNoResultsState());
        log("No matching books found");
      } else {
        emit(HomeFetchLoadedState(
            bookList: filteredBooks, authorName: filteredAuthor));
        print("Emit filtered books. Count: ${filteredBooks.length}");
      }
    }
  }
}
