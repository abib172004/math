import 'package:flutter/material.dart';
import '../models/course_models.dart';
import '../widgets/heading_widget.dart';
import '../widgets/paragraph_widget.dart';
import '../widgets/math_formula_view.dart';
import '../widgets/definition_box.dart';
import '../widgets/example_box.dart';
import '../widgets/correction_box.dart';
import '../widgets/content_table_view.dart';
import '../widgets/content_image_view.dart';

/// Écran affichant le contenu détaillé d'un chapitre.
class ChapterScreen extends StatelessWidget {
  final CourseChapter chapter;

  const ChapterScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    // On "aplatit" la structure du chapitre en une seule liste pour le ListView.
    // Chaque section et chaque élément de contenu devient un item dans la liste.
    final List<dynamic> flatList = [];
    for (final section in chapter.sections) {
      flatList.add(section); // Ajoute l'objet section comme un titre.
      flatList.addAll(section.content); // Ajoute tous les contenus de la section.
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: flatList.length,
        itemBuilder: (context, index) {
          final item = flatList[index];

          // Affiche un grand titre pour chaque nouvelle section.
          if (item is CourseSection) {
            return Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            );
          }
          // Délègue la construction du widget de contenu à une fonction dédiée.
          else if (item is ContentItem) {
            return _buildContentItem(context, item);
          }
          // Retourne un widget vide si le type n'est pas reconnu.
          return const SizedBox.shrink();
        },
      ),
    );
  }

  /// Construit le widget approprié en fonction du type de `ContentItem`.
  /// L'utilisation d'un `switch` sur une classe scellée est type-safe.
  Widget _buildContentItem(BuildContext context, ContentItem item) {
    return switch (item) {
      Heading(text: final t) => HeadingWidget(t),
      Paragraph(text: final t) => ParagraphWidget(t),
      MathFormula(formula: final f) => MathFormulaView(f),
      Definition(content: final c) => DefinitionBox(
          // Appel récursif pour construire le contenu des blocs.
          children: c.map((i) => _buildContentItem(context, i)).toList(),
        ),
      Example(content: final c) => ExampleBox(
          children: c.map((i) => _buildContentItem(context, i)).toList(),
        ),
      Correction(content: final c) => CorrectionBox(
          children: c.map((i) => _buildContentItem(context, i)).toList(),
        ),
      ContentTable(
        headers: final h,
        rows: final r,
        caption: final c
      ) =>
        ContentTableView(tableData: ContentTable(headers: h, rows: r, caption: c)),
      ContentImage(assetPath: final p) => ContentImageView(assetPath: p),
    };
  }
}
