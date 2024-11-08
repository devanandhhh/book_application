import 'package:books_app/core/colors.dart';
import 'package:books_app/data/models/author_model.dart';
import 'package:books_app/data/shared_preference/shared_preference.dart';
import 'package:books_app/presentation/bloc/auth_details/author_details_bloc.dart';
import 'package:books_app/presentation/screens/bottom_nav/widget.dart';
import 'package:books_app/presentation/widgets/others.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/shimmer.dart';

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
      appBar: buildAppbar(context),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return lottieSearch();
        }else{
          return  BlocBuilder<AuthorDetailsBloc, AuthorDetailsState>(
        builder: (context, state) {
          if (state is AuthorDetailsLoadingState) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return buildAuthorCardShimmer();
              },
              itemCount: 10,
              separatorBuilder: (context, index) => kHeight10,
            );
          } else if (state is AuthorDetailsLoadedState) {
            return buildAuthorList(state);
          } else if (state is AuthorDetailsFaliureState) {
            return const Center(
              child: Text('No Data Available'),
            );
          }
          return kHeight10;
        },
      );
        }
      },
     
    );
  }

  ListView buildAuthorList(AuthorDetailsLoadedState state) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final color = colors[index % colors.length];
        final data = state.getAuthorList[index];
        final authorFirstLetter = data.name[0];
        return buildAuthorCard(data, color, authorFirstLetter);
      },
      itemCount: state.getAuthorList.length,
    );
  }

  Card buildAuthorCard(
      AuthorModel data, Color? color, String authorFirstLetter) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(data.name),
        subtitle: Text(
          shortenString(data.biography, 75),
          style: GoogleFonts.aBeeZee(fontSize: 12),
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(authorFirstLetter),
        ),
        //trailing: Icon(Icons.arrow_forward),
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        'Authors',
        style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showLogOutDialog(context);
          },
          icon: const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.logout_rounded),
          ),
        )
      ],
    );
  }

  Future<dynamic> showLogOutDialog(BuildContext context) {
    return showDialog(
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
                  selectedIndex = ValueNotifier<int>(0);
                },
                child: const Text('LogOut'))
          ],
        );
      },
    );
  }
}

String shortenString(String input, int range) {
  return input.length > range ? '${input.substring(0, range)}...' : input;
}
