import 'package:books_app/core/colors.dart';
import 'package:books_app/data/shared_preference/shared_preference.dart';
import 'package:books_app/presentation/bloc/auth_details/author_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AuthorDetailsBloc>().add(AuthorDetailsGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          'Authors',
          style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Logout Confirmation'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () async {
                              await TokenService().clearToken();
                              // ignore: use_build_context_synchronously
                              context.goNamed('register');
                            },
                            child: const Text('LogOut'))
                      ],
                    );
                  },
                );
              },
              icon: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.logout_rounded),
              ))
        ],
      ),
      body: BlocBuilder<AuthorDetailsBloc, AuthorDetailsState>(
        builder: (context, state) {
          if (state is AuthorDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthorDetailsLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final data = state.getAuthorList[index];
                final authorFirstLetter = data.name[0];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(data.name),
                    subtitle: Text(
                      shortenString(data.biography, 75),
                      style: GoogleFonts.aBeeZee(fontSize: 12),
                    ),
                    leading: CircleAvatar(child: Text(authorFirstLetter)),
                    //trailing: Icon(Icons.arrow_forward),
                  ),
                );
              },
              itemCount: state.getAuthorList.length,
            );
          } else if (state is AuthorDetailsFaliureState) {
            return const Center(
              child: Text('No Data Available'),
            );
          }
          return kHeight10;
        },
      ),
    );
  }
}

String dummytext =
    "Robert Toru Kiyosaki is an American businessman and author, known for the Rich Dad Poor Dad series of personal finance books";
String shortenString(String input, int range) {
  if (input.length > range) {
    return '${input.substring(0, range)}...';
  } else {
    return input;
  }
}
