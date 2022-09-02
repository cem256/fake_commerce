import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../config/router/app_router.gr.dart';
import '../../../constants/enums/form_status.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/buttons/google_button.dart';
import '../../../widgets/input/email_input_field.dart';
import '../../../widgets/input/password_input_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
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
                content: Text("Account successfully created"),
              ),
            );
            context.router.replace(const LoginRoute());
          }
        },
        child: Padding(
          padding: context.paddingAllDefault,
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Text(
                    "Enter your email and password to register",
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return EmailInputField(
                        textInputAction: TextInputAction.next,
                        isValidEmail: state.isValidEmail,
                        onChanged: (email) => context.read<RegisterBloc>().add(RegisterEmailChanged(email)),
                      );
                    },
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return PasswordInputField(
                        obscureText: state.isPasswordObscured,
                        textInputAction: TextInputAction.next,
                        isValid: state.isValidPassword,
                        onPressed: () => context.read<RegisterBloc>().add(RegisterPasswordVisibilityChanged()),
                        onChanged: (password) => context.read<RegisterBloc>().add(RegisterPasswordChanged(password)),
                      );
                    },
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          buttonText: "Register",
                          isValid: ((state.isValidPassword ?? false) && (state.isValidEmail ?? false)),
                          status: state.status,
                          onPressed: () => context.read<RegisterBloc>().add(RegisterSubmitted()),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: GoogleButton(
                          label: "Register with Google",
                          onPressed: () => context.read<RegisterBloc>().add(RegisterWithGooglePressed()),
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
                      const Text("Already have an account?"),
                      TextButton(
                        child: const Text("Login"),
                        onPressed: () => context.router.replace(
                          const LoginRoute(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
