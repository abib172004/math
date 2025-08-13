import 'package:flutter/material.dart';

/// Un widget pour afficher un bloc "Correction" avec un style visuel spécifique.
class CorrectionBox extends StatelessWidget {
  final List<Widget> children;

  const CorrectionBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // Utilise une couleur verte pour signifier une solution/correction.
    final Color color = Colors.green.shade700;

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
              Icon(Icons.check_circle_outline, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                'Correction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Le contenu de la correction est passé ici.
          ...children,
        ],
      ),
    );
  }
}
