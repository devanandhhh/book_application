import 'package:books_app/data/shared_preference/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/others.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      final shardPrefs = await TokenService().checkRegistrationStatus();

      if (!context.mounted) return;
      if (shardPrefs != true) {
        // ignore: use_build_context_synchronously
        context.goNamed('register');
      } else {
        // ignore: use_build_context_synchronously
        context.goNamed('bottomNav');
      }
    });
    return Scaffold(
      backgroundColor: Colors.orange[700],
      body: Center(
        child: iconContainer(),
      ),
    );
  }
}
