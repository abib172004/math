import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// La clé utilisée pour sauvegarder la préférence du thème.
const String _themePrefKey = 'app_theme_mode';

/// Le Notifier qui gère l'état du thème de l'application.
/// Il sauvegarde le choix de l'utilisateur dans les SharedPreferences.
class ThemeNotifier extends Notifier<ThemeMode> {
  late SharedPreferences _prefs;

  @override
  ThemeMode build() {
    // La valeur par défaut est le thème du système.
    // Le chargement asynchrone se fera dans la méthode `init`.
    return ThemeMode.system;
  }

  /// Initialise le provider en chargeant la préférence sauvegardée.
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final themeIndex = _prefs.getInt(_themePrefKey);
    if (themeIndex != null && themeIndex < ThemeMode.values.length) {
      state = ThemeMode.values[themeIndex];
    }
  }

  /// Méthode pour changer le thème et le sauvegarder.
  Future<void> setThemeMode(ThemeMode mode) async {
    // Met à jour l'état du provider.
    state = mode;
    // Sauvegarde la nouvelle préférence.
    await _prefs.setInt(_themePrefKey, mode.index);
  }

  /// Méthode pour passer au thème suivant (clair -> sombre -> système -> clair).
  void cycleTheme() {
    final nextIndex = (state.index + 1) % ThemeMode.values.length;
    setThemeMode(ThemeMode.values[nextIndex]);
  }
}

/// Le Provider qui expose le ThemeNotifier à l'application.
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);
