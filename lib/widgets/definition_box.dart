import 'package:flutter/material.dart';

/// Un widget pour afficher un bloc "Définition" avec un style visuel spécifique.
class DefinitionBox extends StatelessWidget {
  final List<Widget> children;

  const DefinitionBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // Utilise la couleur primaire du thème pour la décoration.
    final Color color = Theme.of(context).colorScheme.primary;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // Couleur de fond légère pour faire ressortir le bloc.
        color: color.withOpacity(0.05),
        // Bordure gauche colorée pour attirer l'attention.
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
              Icon(Icons.lightbulb_outline, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                'Définition',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Le contenu de la définition est passé ici.
          ...children,
        ],
      ),
    );
  }
}
