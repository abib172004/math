import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  // Ici, on pourrait ajouter l'initialisation de services comme Hive
  // avant de lancer l'application.
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // Le ProviderScope stocke l'état de tous nos providers (Riverpod).
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SenCours Math',
      debugShowCheckedModeBanner: false,
      // Le thème est maintenant géré par la classe AppTheme.
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // S'adapte automatically au thème du système.

      // La configuration de la navigation est fournie par GoRouter.
      routerConfig: AppRouter.router,
    );
  }
}
