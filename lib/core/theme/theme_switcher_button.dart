import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_provider.dart';

/// Un bouton qui permet à l'utilisateur de passer d'un thème à l'autre
/// (Clair -> Sombre -> Système).
class ThemeSwitcherButton extends ConsumerWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observe le mode de thème actuel pour mettre à jour l'icône.
    final themeMode = ref.watch(themeProvider);

    // Détermine l'icône et le tooltip à afficher en fonction du thème.
    final (IconData icon, String tooltip) = switch (themeMode) {
      ThemeMode.light => (Icons.dark_mode_outlined, 'Passer au thème sombre'),
      ThemeMode.dark => (Icons.light_mode_outlined, 'Passer au thème clair'),
      ThemeMode.system => (Icons.settings_brightness_outlined, 'Utiliser le thème du système'),
    };

    return IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      onPressed: () {
        // Appelle la méthode du notifier pour changer de thème.
        ref.read(themeProvider.notifier).cycleTheme();
      },
    );
  }
}
