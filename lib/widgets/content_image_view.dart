import 'package:flutter/material.dart';

/// Un widget pour afficher une image depuis les assets.
/// Gère le cas où l'image n'est pas trouvée.
class ContentImageView extends StatelessWidget {
  final String assetPath;

  const ContentImageView({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Image.asset(
        assetPath,
        // En cas d'erreur (ex: l'image n'existe pas dans les assets),
        // on affiche un message clair à l'utilisateur.
        errorBuilder: (context, error, stackTrace) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade200,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_not_supported_outlined, color: Colors.grey),
                SizedBox(width: 8),
                Text("Graphique bientôt disponible"),
              ],
            ),
          );
        },
      ),
    );
  }
}
