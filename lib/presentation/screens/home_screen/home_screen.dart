import 'dart:developer';

import 'package:books_app/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/home_fetch/home_fetch_bloc.dart';
import '../../widgets/others.dart';
import '../../widgets/shimmer.dart';
import 'widgets/book_grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HomeFetchBloc>().add(BooksFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            kHeight10,
            buildSearchBar(context),
            kHeight10,
            buildBookGrid()
          ],
        ),
      ),
    );
  }

  Flexible buildBookGrid() {
    return Flexible(
      child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return lottieSearch();
            } else {
              return BlocBuilder<HomeFetchBloc, HomeFetchState>(
                builder: (context, state) {
                  if (state is HomeFetchLoadingState) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0,
                              childAspectRatio: .62),
                      itemBuilder: (context, index) {
                        return const BookGridItemShimmer();
                      },
                      itemCount: 10,
                    );
                  } else if (state is HomeFetchNoResultsState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          lottieSearch(),
                          const Text(
                            'No results found',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  } else if (state is HomeFetchLoadedState) {
                    log("Loaded State with ${state.bookList.length} items"); // Debugging line
                    return buildBookGridView(state);
                  } else if (state is HomeFetchFaliureState) {
                    return const Text('Try Again');
                  }
                  return kHeight10;
                },
              );
            }
          }),
    );
  }

  GridView buildBookGridView(HomeFetchLoadedState state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: .62),
      itemBuilder: (context, index) {
        // final color = colors[index % colors.length];
        final bookData = state.bookList[index];
        final authorData = index < state.authorName.length
            ? state.authorName[index]
            : 'Unknown Author';

        // final authorData = state.authorName[index];
        return InkWell(
          onTap: () {
            final color = colors[index % colors.length];
            context.pushNamed('viewDetails', extra: {
              'bookModel': state.bookList[index],
              'authorName': state.authorName[index].isEmpty
                  ? 'Unknown'
                  : state.authorName[index],
              'bgColor': color
            });
          },
          child: BookGridItem(bookData: bookData, authorData: authorData),
        );
      },
      itemCount: state.bookList.length,
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return CupertinoSearchTextField(
      controller: searchController,
      onChanged: (query) {
        if (query.isEmpty) {
          // If query is empty, fetch all books
          context.read<HomeFetchBloc>().add(BooksFetchEvent());
        } else {
          // Otherwise, search books
          context.read<HomeFetchBloc>().add(SearchBookEvent(query: query));
        }
      },
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: Text('App name',
          style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold)),
    );
  }
}
