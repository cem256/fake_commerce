import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/login/login_bloc.dart';
import '../../../config/router/app_router.gr.dart';
import '../../../constants/enums/form_status.dart';
import '../../../constants/extensions/context_extensions.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/input/email_input_field.dart';
import '../../../widgets/input/password_input_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to your account"),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == FormStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Something went wrong"),
              ),
            );
          } else if (state.status == FormStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Successful login"),
              ),
            );
          }
        },
        child: Padding(
          padding: context.paddingAllDefault,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return EmailInputField(
                      textInputAction: TextInputAction.next,
                      isValidEmail: state.isValidEmail,
                      onChanged: (email) => context.read<LoginBloc>().add(LoginEmailChanged(email)),
                    );
                  },
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return PasswordInputField(
                      obscureText: state.isPasswordObscured,
                      textInputAction: TextInputAction.next,
                      isValid: state.isValidPassword,
                      onPressed: () => context.read<LoginBloc>().add(const LoginPasswordVisibilityChanged()),
                      onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
                    );
                  },
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        buttonText: "Login",
                        isValid: ((state.isValidPassword ?? false) && (state.isValidEmail ?? false)),
                        status: state.status,
                        onPressed: () => context.read<LoginBloc>().add(const LoginSubmitted()),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: context.highValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      child: const Text("Register"),
                      onPressed: () => context.router.replace(const RegisterRoute()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
