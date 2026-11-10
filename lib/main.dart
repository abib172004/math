import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';

Future<void> main() async {
  // S'assurer que le binding des widgets est initialisé avant toute opération asynchrone.
  WidgetsFlutterBinding.ensureInitialized();

  // Crée un conteneur de provider pour pouvoir initialiser le themeProvider avant runApp.
  final container = ProviderContainer();
  // Initialise le thème en chargeant les préférences sauvegardées.
  await container.read(themeProvider.notifier).init();

  runApp(
    // Utilise UncontrolledProviderScope pour passer le conteneur pré-initialisé.
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

/// Le widget racine de l'application.
/// C'est un ConsumerWidget pour pouvoir écouter les changements de thème.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Écoute les changements du themeProvider.
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'SenCours Math',
      debugShowCheckedModeBanner: false,
      // Applique les thèmes définis.
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // Le mode de thème est contrôlé par le provider.
      themeMode: themeMode,
      // La configuration de la navigation est gérée par GoRouter.
      routerConfig: AppRouter.router,
    );
  }
}
