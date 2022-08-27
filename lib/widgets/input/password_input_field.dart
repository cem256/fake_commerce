import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    Key? key,
    required this.obscureText,
    this.isValid,
    this.onPressed,
    this.onChanged,
    required this.textInputAction,
  }) : super(key: key);
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool? isValid;
  final void Function()? onPressed;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.password),
        labelText: "Password",
        errorText: (isValid ?? true) ? null : "Password must be at least 6 characters long",
        suffixIcon: IconButton(
          icon: obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
          onPressed: onPressed,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
