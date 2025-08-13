import 'package:flutter/material.dart';

/// Un widget pour afficher un paragraphe de texte.
/// Il gère la mise en gras simple du texte encadré par `**`.
class ParagraphWidget extends StatelessWidget {
  final String text;

  const ParagraphWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    // Sépare le texte par la balise de mise en gras `**`.
    final List<String> parts = text.split('**');
    final List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      // Les parties impaires sont celles qui se trouvent entre les balises.
      if (i.isOdd) {
        spans.add(TextSpan(
          text: parts[i],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
      } else {
        spans.add(TextSpan(text: parts[i]));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          // Style par défaut pour le paragraphe, hérité du thème.
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
          children: spans,
        ),
      ),
    );
  }
}
