import 'package:books_app/presentation/screens/auth_screen/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors.dart';
import '../../../bloc/password_visibility/password_visibility_cubit.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String? Function(String?) validator;

  const PasswordField({
    required this.controller,
    required this.label,
    required this.hintText,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
      builder: (context, state) {
        final isVisible = (state is PasswordVisibilityInitial) ? state.isVisible : true;
        return CustomTextField(
          label: label,
          hintText: hintText,
          controller: controller,
          validator: validator,
          obscureText: isVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
              color: kGrey600,
            ),
            onPressed: () {
              context.read<PasswordVisibilityCubit>().toggleVisibility();
            },
          ),
        );
      },
    );
  }
}
