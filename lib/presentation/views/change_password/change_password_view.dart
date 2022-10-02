import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/form_status.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../locator.dart';
import '../../../logic/change_password/change_password_bloc.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/input/password_input_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: BlocProvider(
        create: (context) => getIt<ChangePasswordBloc>(),
        child: const _ChangePasswordBody(),
      ),
    );
  }
}

class _ChangePasswordBody extends StatelessWidget {
  const _ChangePasswordBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state.status == FormStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage.toString()),
            ),
          );
        } else if (state.status == FormStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Your password successfully updated. Please login again."),
            ),
          );
        }
      },
      child: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter your new password. Your password must be at least 6 characters long."),
            SizedBox(
              height: context.mediumValue,
            ),
            BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
              builder: (context, state) {
                return PasswordInputField(
                  labelText: "New Password",
                  obscureText: state.isPasswordObscured,
                  textInputAction: TextInputAction.done,
                  isValid: state.isValidPassword,
                  onChanged: (password) => context.read<ChangePasswordBloc>().add(PasswordModified(password: password)),
                  onPressed: () => context.read<ChangePasswordBloc>().add(ChangePasswordVisibilityChanged()),
                );
              },
            ),
            SizedBox(
              height: context.highValue,
            ),
            BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    buttonText: "Change Password",
                    onPressed: () => context.read<ChangePasswordBloc>().add(ChangePasswordSubmitted()),
                    status: state.status,
                    isValid: state.isValidPassword ?? false,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
