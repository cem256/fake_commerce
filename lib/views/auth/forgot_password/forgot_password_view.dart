import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../constants/enums/form_status.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/input/email_input_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
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
                content: Text("Password reset link sent to the email provided. (Check your spam.)"),
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
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return EmailInputField(
                      textInputAction: TextInputAction.done,
                      isValidEmail: state.isValidEmail,
                      onChanged: (email) => context.read<ForgotPasswordBloc>().add(ForgotPasswordEmailChanged(email)),
                    );
                  },
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        buttonText: "Send reset",
                        isValid: ((state.isValidEmail ?? false)),
                        status: state.status,
                        onPressed: () => context.read<ForgotPasswordBloc>().add(const ForgotPasswordSubmitted()),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: context.highValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
