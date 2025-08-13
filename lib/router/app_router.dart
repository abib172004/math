import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/chapter_screen.dart';
import '../data/limites_data.dart';
import '../models/course_models.dart';

/// Centralise la configuration de la navigation de l'application avec GoRouter.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // Utile pour le débogage de la navigation.

    routes: [
      // Route pour l'écran d'accueil.
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // Route pour l'écran de détail d'un chapitre.
      // Utilise un paramètre dynamique `:id` pour identifier le chapitre.
      GoRoute(
        path: '/chapter/:id',
        name: 'chapter',
        builder: (context, state) {
          final chapterId = state.pathParameters['id'];

          // Dans une application plus complexe, on utiliserait un service
          // pour récupérer les données du chapitre. Ici, on cherche dans
          // nos données codées en dur.
          final CourseChapter chapter;
          if (chapterId == limitesChapterS1S2.id) {
            chapter = limitesChapterS1S2;
          } else {
            // Si l'ID n'est pas trouvé, on peut afficher une page d'erreur
            // ou rediriger vers l'accueil.
            return const Scaffold(
              body: Center(child: Text('Chapitre non trouvé !')),
            );
          }

          return ChapterScreen(chapter: chapter);
        },
      ),
    ],

    // Page à afficher en cas d'erreur de navigation.
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Erreur de navigation : ${state.error}'),
      ),
    ),
  );
}
