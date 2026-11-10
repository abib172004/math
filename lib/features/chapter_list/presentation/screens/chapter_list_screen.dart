import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/models/course_models.dart';
import '../../../../core/theme/theme_switcher_button.dart';
import '../../data/course_data.dart';

/// Écran affichant la liste des chapitres pour une classe donnée.
class ChapterListScreen extends StatelessWidget {
  final String classId;
  const ChapterListScreen({super.key, required this.classId});

  @override
  Widget build(BuildContext context) {
    // Récupère les données de la classe sélectionnée.
    // Ajoute une gestion d'erreur si l'ID n'est pas trouvé.
    final SchoolClass schoolClass;
    try {
      schoolClass = schoolClasses.firstWhere((c) => c.id == classId);
    } catch (e) {
      // Si la classe n'est pas trouvée, affiche une erreur.
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Erreur : Classe non trouvée.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(schoolClass.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            tooltip: 'Accueil',
            onPressed: () => context.go('/'),
          ),
          const ThemeSwitcherButton(),
        ],
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: schoolClass.chapters.length,
          itemBuilder: (context, index) {
            final chapter = schoolClass.chapters[index];
            // Applique une animation à chaque élément de la liste.
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _ChapterCard(chapter: chapter, classId: classId),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Widget privé pour la carte d'un chapitre.
class _ChapterCard extends StatelessWidget {
  final Chapter chapter;
  final String classId;

  const _ChapterCard({required this.chapter, required this.classId});

  @override
  Widget build(BuildContext context) {
    // Un chapitre est considéré comme "disponible" si au moins une de ses leçons l'est.
    final bool isAvailable = chapter.lessonTopics.any((topic) => topic.isAvailable);
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isAvailable ? theme.colorScheme.primary : theme.colorScheme.surfaceVariant,
          foregroundColor: isAvailable ? theme.colorScheme.onPrimary : theme.colorScheme.onSurfaceVariant,
          child: isAvailable ? const Icon(Icons.auto_stories_outlined, size: 20) : const Icon(Icons.lock_outline, size: 20),
        ),
        title: Text(chapter.title),
        subtitle: isAvailable ? null : const Text('Bientôt disponible'),
        enabled: isAvailable,
        trailing: isAvailable ? const Icon(Icons.arrow_forward_ios, size: 16) : null,
        onTap: isAvailable
            ? () => context.go('/class/$classId/chapter/${chapter.id}')
            : null,
      ),
    );
  }
}
