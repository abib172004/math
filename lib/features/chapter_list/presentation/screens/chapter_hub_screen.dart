import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/course_models.dart';
import '../../../../core/theme/theme_switcher_button.dart';
import '../../data/course_data.dart';

/// Écran "Hub" qui sert de point d'entrée pour un chapitre.
/// Permet de choisir entre la Leçon et les Exercices.
class ChapterHubScreen extends StatelessWidget {
  final String classId;
  final String chapterId;

  const ChapterHubScreen({
    super.key,
    required this.classId,
    required this.chapterId,
  });

  @override
  Widget build(BuildContext context) {
    // Récupère les données du chapitre.
    final chapter = schoolClasses
        .firstWhere((c) => c.id == classId)
        .chapters
        .firstWhere((ch) => ch.id == chapterId);

    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            tooltip: 'Accueil',
            onPressed: () => context.go('/'),
          ),
          const ThemeSwitcherButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Que souhaitez-vous faire ?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 48),
            _HubCard(
              title: 'Leçon',
              icon: Icons.auto_stories_outlined,
              onTap: () {
                // S'il n'y a qu'un seul sujet de leçon, on y va directement.
                // Sinon, on ira vers un écran de sélection de sujet.
                if (chapter.lessonTopics.length == 1) {
                  final topic = chapter.lessonTopics.first;
                  if (topic.isAvailable) {
                    context.go('/class/$classId/chapter/$chapterId/lesson/${topic.id}');
                  }
                } else {
                  // TODO: Naviguer vers un écran de sélection de sujet de leçon.
                  // Pour l'instant, on navigue vers le premier sujet disponible.
                  final availableTopic = chapter.lessonTopics.firstWhere((t) => t.isAvailable, orElse: () => chapter.lessonTopics.first);
                   context.go('/class/$classId/chapter/$chapterId/lesson/${availableTopic.id}');
                }
              },
            ),
            const SizedBox(height: 24),
            _HubCard(
              title: 'Exercices',
              icon: Icons.edit_note_outlined,
              isEnabled: chapter.hasExercises,
              onTap: () {
                // TODO: Naviguer vers l'écran des exercices.
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget privé pour les cartes de choix du Hub.
class _HubCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isEnabled;
  final VoidCallback? onTap;

  const _HubCard({
    required this.title,
    required this.icon,
    this.isEnabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isEnabled ? theme.colorScheme.primary : theme.disabledColor;

    return Card(
      elevation: isEnabled ? 2 : 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
