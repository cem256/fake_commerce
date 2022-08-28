import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../constants/enums/form_status.dart';
import '../../../constants/extensions/context_extensions.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/input/email_input_field.dart';
import '../../../widgets/input/password_input_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create your account"),
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
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
                content: Text("Account successfully created"),
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
                SizedBox(
                  height: context.highValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account?"),
                    TextButton(child: const Text("Login"), onPressed: () {}),
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
