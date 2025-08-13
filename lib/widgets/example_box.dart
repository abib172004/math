import 'package:flutter/material.dart';

/// Un widget pour afficher un bloc "Exemple" avec un style visuel spécifique.
class ExampleBox extends StatelessWidget {
  final List<Widget> children;

  const ExampleBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // Utilise une couleur secondaire/tertiaire pour différencier de la définition.
    final Color color = Theme.of(context).colorScheme.secondary;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        border: Border(
          left: BorderSide(
            color: color,
            width: 4.0,
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.edit_note_outlined, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                'Exemple',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Le contenu de l'exemple est passé ici.
          ...children,
        ],
      ),
    );
  }
}
