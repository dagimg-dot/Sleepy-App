import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        label,
        style: const  TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(255, 216, 81, 57),
      behavior: SnackBarBehavior.floating,
    );
  }
}