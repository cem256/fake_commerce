import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/form_status.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../locator.dart';
import '../../../../logic/auth/register/register_bloc.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/buttons/google_button.dart';
import '../../../widgets/input/email_input_field.dart';
import '../../../widgets/input/password_input_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<RegisterBloc>(),
        child: const _RegisterViewBody(),
      ),
    );
  }
}

class _RegisterViewBody extends StatelessWidget {
  const _RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == FormStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage.toString()),
            ),
          );
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
                Center(
                  child: Icon(
                    Icons.store,
                    size: context.veryHighValue,
                  ),
                ),
                SizedBox(
                  height: context.highValue,
                ),
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
                      onChanged: (email) => context.read<RegisterBloc>().add(
                            RegisterEvent.emailChanged(email),
                          ),
                    );
                  },
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return PasswordInputField(
                      labelText: "Password",
                      obscureText: state.isPasswordObscured,
                      textInputAction: TextInputAction.next,
                      isValid: state.isValidPassword,
                      onPressed: () => context.read<RegisterBloc>().add(
                            const RegisterEvent.passwordVisibilityChanged(),
                          ),
                      onChanged: (password) => context.read<RegisterBloc>().add(
                            RegisterEvent.passwordChanged(password),
                          ),
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
                        onPressed: () => context.read<RegisterBloc>().add(
                              const RegisterEvent.registerSubmitted(),
                            ),
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
                        onPressed: () => context.read<RegisterBloc>().add(
                              const RegisterEvent.registerWithGooglePressed(),
                            ),
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
                      onPressed: () => context.router.pop(
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
    );
  }
}
