import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const FaIcon(FontAwesomeIcons.google),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
