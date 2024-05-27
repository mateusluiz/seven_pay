import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String text,
  required Color backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 4),
    ),
  );
}
