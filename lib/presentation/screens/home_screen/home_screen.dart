import 'dart:developer';

import 'package:books_app/core/colors.dart';
import 'package:books_app/presentation/screens/authors_screen/authors_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/home_fetch/home_fetch_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color?> colors = [kRed200, kGreen200, kblue200, kOrange200];
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
      appBar: AppBar(
        title: Text('App name',
            style:
                GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              onChanged: (query) {
                if (query.isEmpty) {
                  // If query is empty, fetch all books
                  context.read<HomeFetchBloc>().add(BooksFetchEvent());
                } else {
                  // Otherwise, search books
                  context
                      .read<HomeFetchBloc>()
                      .add(SearchBookEvent(query: query));
                }
              },
            ),
            kHeight10,
            Flexible(
              child: BlocBuilder<HomeFetchBloc, HomeFetchState>(
                builder: (context, state) {
                  if (state is HomeFetchLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeFetchNoResultsState) {
                    return const Center(
                        child: Text('No results found',
                            style: TextStyle(fontSize: 18)));
                  } else if (state is HomeFetchLoadedState) {
                    log(
                        "Loaded State with ${state.bookList.length} items"); // Debugging line
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            context.pushNamed('viewDetails', extra: {
                              'bookModel': state.bookList[index],
                            });
                          },
                          child: Container(
                            color: kWhite,
                            //decoration: BoxDecoration(border: Border.all(color: Colors.black,width: .10)),
                            // color: Colors.teal,
                            height: 400,
                            width: 100,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, top: 10, bottom: 10),
                                  child: SizedBox(
                                    // decoration: BoxDecoration(
                                    //   color: kGrey600,
                                    // ),
                                    height: MediaQuery.of(context).size.height *
                                        0.24,
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                        Image.network(bookData.coverPictureURL),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shortenString(bookData.title, 19),
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(authorData),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: kOrange,
                                            size: 20,
                                          ),
                                          Text(
                                            '4.0',
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '₹ ${bookData.price}.00',
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: state.bookList.length,
                    );
                  } else if (state is HomeFetchFaliureState) {
                    return const Text('Try Again');
                  }
                  return kHeight10;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
