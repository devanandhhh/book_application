
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors.dart';

class AlreadyRegisteredWidget extends StatelessWidget {
  const AlreadyRegisteredWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already Registerd?'),
        TextButton(
          onPressed: () {
            context.pushNamed('login');
          },
          child: const Text('Login',
              style: TextStyle(fontWeight: FontWeight.bold, color: kOrange)),
        )
      ],
    );
  }
}

Container authButton(String? text) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: Colors.orange[800],
    ),
    child: Center(
        child: Text(
      text!,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
    )),
  );
}
