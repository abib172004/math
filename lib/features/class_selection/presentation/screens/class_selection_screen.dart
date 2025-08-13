import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/models/course_models.dart';
import '../../../chapter_list/data/course_data.dart';

/// L'écran d'accueil de l'application, où l'utilisateur choisit sa classe.
class ClassSelectionScreen extends StatelessWidget {
  const ClassSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Animation pour un accueil plus chaleureux
              Lottie.asset(
                'assets/animations/math_animation.json',
                width: 250,
                height: 250,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.school_outlined, size: 150, color: Colors.grey);
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Bienvenue sur SenCours',
                style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Votre compagnon pour réussir en Mathématiques.',
                style: textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Text(
                'Veuillez choisir votre classe',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              // Création des cartes de sélection pour chaque classe
              ...schoolClasses.map((schoolClass) => _ClassSelectionCard(schoolClass: schoolClass)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget privé pour la carte de sélection de classe.
class _ClassSelectionCard extends StatelessWidget {
  final SchoolClass schoolClass;

  const _ClassSelectionCard({required this.schoolClass});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Navigation vers la liste des chapitres de la classe sélectionnée.
          context.go('/class/${schoolClass.id}');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schoolClass.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      schoolClass.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
