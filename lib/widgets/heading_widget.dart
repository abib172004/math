import 'package:flutter/material.dart';

/// Un widget pour afficher un sous-titre de section (H3, H4, etc.).
class HeadingWidget extends StatelessWidget {
  final String text;

  const HeadingWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
