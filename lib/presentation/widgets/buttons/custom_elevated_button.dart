import 'package:flutter/material.dart';

import '../../../core/enums/form_status.dart';
import '../../../core/extensions/context_extensions.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.status,
    required this.isValid,
  });

  final String buttonText;
  final void Function()? onPressed;
  final FormStatus status;
  final bool? isValid;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isValid ?? true ? onPressed : null,
      child: status == FormStatus.submitting
          ? SizedBox(
              height: context.mediumValue,
              width: context.mediumValue,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(buttonText),
    );
  }
}
