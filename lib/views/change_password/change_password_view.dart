import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/settings/settings_bloc.dart';
import '../../config/router/app_router.gr.dart';
import '../../constants/enums/form_status.dart';
import '../../core/extensions/context_extensions.dart';
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
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter your new password. Your password must be at least 6 characters long."),
            SizedBox(
              height: context.mediumValue,
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return PasswordInputField(
                  labelText: "New Password",
                  obscureText: state.isPasswordObscured,
                  textInputAction: TextInputAction.done,
                  isValid: state.isValidPassword,
                  onChanged: (password) => context.read<SettingsBloc>().add(ChangePasswordChanged(password)),
                  onPressed: () => context.read<SettingsBloc>().add(ChangePasswordVisibilityChanged()),
                );
              },
            ),
            SizedBox(
              height: context.highValue,
            ),
            BlocConsumer<SettingsBloc, SettingsState>(
              listener: (context, state) {
                if (state.status == FormStatus.failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.changePasswordErrorMessage.toString()),
                    ),
                  );
                } else if (state.status == FormStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Your password successfully updated. Please login again."),
                    ),
                  );
                  context.router.replace(const LoginRoute());
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    buttonText: "Change Password",
                    onPressed: () => context.read<SettingsBloc>().add(ChangePasswordSubmitted()),
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
