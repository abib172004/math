import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

/// Un widget dédié à l'affichage d'une formule mathématique (LaTeX).
/// Il centralise le style et la configuration du rendu des formules.
class MathFormulaView extends StatelessWidget {
  final String formula;

  const MathFormulaView(this.formula, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Math.tex(
          formula,
          // Le style du texte de la formule.
          textStyle: TextStyle(
            fontSize: 18,
            // La couleur s'adapte au thème (clair ou sombre).
            color: Theme.of(context).colorScheme.onSurface,
          ),
          // En cas d'erreur de parsing de la formule.
          onErrorFallback: (err) {
            return Text(
              'Erreur de formule : $formula',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            );
          },
        ),
      ),
    );
  }
}
