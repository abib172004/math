import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/limites_data.dart';
import '../models/course_models.dart';

/// Écran d'accueil de l'application.
/// Affiche la liste des chapitres disponibles.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Pour l'instant, la liste des chapitres est codée en dur.
    // Plus tard, elle pourra provenir d'un service ou d'un provider.
    final List<CourseChapter> chapters = [limitesChapterS1S2];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mathématiques - Terminale S'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                child: const Icon(Icons.functions),
              ),
              title: Text(
                chapter.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Séries : ${chapter.series}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Utilise GoRouter pour naviguer vers l'écran du chapitre correspondant.
                context.go('/chapter/${chapter.id}');
              },
            ),
          );
        },
      ),
    );
  }
}
