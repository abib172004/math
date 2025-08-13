import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/class_selection/presentation/screens/class_selection_screen.dart';
import '../../features/chapter_list/presentation/screens/chapter_list_screen.dart';
import '../../features/chapter_list/presentation/screens/chapter_hub_screen.dart';
import '../../features/lesson/presentation/screens/lesson_screen.dart';
// Import screens here once they are created
// ...

/// Centralise la configuration de la navigation de l'application.
/// Utilise GoRouter pour une gestion des routes claire et hiérarchique.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // Active les logs pour le débogage de la navigation

    routes: [
      // Route pour l'écran d'accueil (sélection de la classe)
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ClassSelectionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),

      // Route pour la liste des chapitres d'une classe
      GoRoute(
        path: '/class/:classId',
        name: 'class',
        pageBuilder: (context, state) {
          final classId = state.pathParameters['classId']!;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ChapterListScreen(classId: classId),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          );
        },
        routes: [
          // Route imbriquée pour le hub d'un chapitre (Leçon / Exercices)
          GoRoute(
            path: 'chapter/:chapterId',
            name: 'chapterHub',
            pageBuilder: (context, state) {
              final classId = state.pathParameters['classId']!;
              final chapterId = state.pathParameters['chapterId']!;
              return CustomTransitionPage(
                key: state.pageKey,
                child: ChapterHubScreen(classId: classId, chapterId: chapterId),
                transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
              );
            },
            routes: [
              // Route pour la leçon d'un chapitre/sujet
              GoRoute(
                path: 'lesson/:topicId',
                name: 'lesson',
                pageBuilder: (context, state) {
                  final classId = state.pathParameters['classId']!;
                  final chapterId = state.pathParameters['chapterId']!;
                  final topicId = state.pathParameters['topicId']!;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: LessonScreen(
                      classId: classId,
                      chapterId: chapterId,
                      topicId: topicId,
                    ),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                  );
                },
              ),
              // On pourrait ajouter une route pour les exercices ici
              // path: 'exercises/:exerciseId'
            ],
          ),
        ],
      ),
    ],

    // Page à afficher en cas d'erreur de navigation
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Erreur 404 : Page non trouvée\n${state.error}'),
      ),
    ),
  );
}
