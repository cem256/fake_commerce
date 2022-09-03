import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    Key? key,
    required this.textInputAction,
    this.isValidEmail,
    this.onChanged,
  }) : super(key: key);

  final TextInputAction textInputAction;
  final bool? isValidEmail;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.email),
        labelText: "Email",
        errorText: (isValidEmail ?? true) ? null : "Invalid email",
      ),
      onChanged: onChanged,
    );
  }
}
