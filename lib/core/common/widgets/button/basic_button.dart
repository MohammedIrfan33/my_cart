import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final double height;

  const BasicAppButton({
    super.key,
    required this.title,
    required this.action,
    this.height = 50, // Default height is 50
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity, // Full width button
      child: ElevatedButton(
        onPressed: action,
        
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white, // Text color
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
