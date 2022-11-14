import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/form_status.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../locator.dart';
import '../../../../logic/auth/forgot_password/forgot_password_bloc.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/input/email_input_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ForgotPasswordBloc>(),
        child: const _ForgotPasswordViewBody(),
      ),
    );
  }
}

class _ForgotPasswordViewBody extends StatelessWidget {
  const _ForgotPasswordViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
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
              content: Text('Password reset link sent to the email provided. (Check your spam.)'),
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
                Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                const Text(
                  'Please provide your email and we will send you a link to reset your password',
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return EmailInputField(
                      textInputAction: TextInputAction.done,
                      isValidEmail: state.isValidEmail,
                      onChanged: (email) => context.read<ForgotPasswordBloc>().add(
                            ForgotPasswordEvent.emailChanged(email),
                          ),
                    );
                  },
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        buttonText: 'Reset',
                        isValid: state.isValidEmail ?? false,
                        status: state.status,
                        onPressed: () =>
                            context.read<ForgotPasswordBloc>().add(const ForgotPasswordEvent.passwordSubmitted()),
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
                    const Text('Already have an account?'),
                    TextButton(
                      child: const Text('Login'),
                      onPressed: () => context.router.pop(const LoginRoute()),
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
