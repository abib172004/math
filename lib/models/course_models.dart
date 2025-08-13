import 'package:flutter/foundation.dart';

/// Classe de base scellée pour tous les types de contenu.
/// L'utilisation d'une classe scellée garantit que nous gérons tous les cas possibles
/// dans l'interface utilisateur, ce qui évite les erreurs à l'exécution.
@immutable
sealed class ContentItem {
  const ContentItem();
}

/// Un sous-titre dans une section.
class Heading extends ContentItem {
  final String text;
  const Heading(this.text);
}

/// Un paragraphe de texte simple.
class Paragraph extends ContentItem {
  final String text;
  const Paragraph(this.text);
}

/// Un bloc de définition, qui sera stylisé différemment.
class Definition extends ContentItem {
  final List<ContentItem> content;
  const Definition({required this.content});
}

/// Un bloc d'exemple, qui sera aussi stylisé.
class Example extends ContentItem {
  final List<ContentItem> content;
  const Example({required this.content});
}

/// Une formule mathématique à rendre avec LaTeX.
class MathFormula extends ContentItem {
  final String formula;
  const MathFormula(this.formula);
}

/// Une image à afficher depuis les assets.
class ContentImage extends ContentItem {
  final String assetPath;
  const ContentImage(this.assetPath);
}

/// Un tableau de données.
class ContentTable extends ContentItem {
  final List<String> headers;
  final List<List<String>> rows;
  final String? caption;
  const ContentTable({required this.headers, required this.rows, this.caption});
}

/// Un bloc de correction.
class Correction extends ContentItem {
    final List<ContentItem> content;
    const Correction({required this.content});
}

/// Représente une section d'un chapitre (ex: "Limite infinie").
@immutable
class CourseSection {
  final String title;
  final List<ContentItem> content;

  const CourseSection({
    required this.title,
    required this.content,
  });
}

/// Représente un chapitre complet du cours.
@immutable
class CourseChapter {
  final String id;
  final String title;
  final String series; // ex: "S1", "S2"
  final List<CourseSection> sections;

  const CourseChapter({
    required this.id,
    required this.title,
    required this.series,
    required this.sections,
  });
}
