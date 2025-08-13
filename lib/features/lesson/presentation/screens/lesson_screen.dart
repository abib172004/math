import 'package:flutter/material.dart';

import '../../../../core/models/course_models.dart';
import '../../../chapter_list/data/course_data.dart';
import '../widgets/content_widgets.dart';

/// Écran qui affiche le contenu détaillé d'une leçon (d'un sujet de leçon).
class LessonScreen extends StatelessWidget {
  final String classId;
  final String chapterId;
  final String topicId;

  const LessonScreen({
    super.key,
    required this.classId,
    required this.chapterId,
    required this.topicId,
  });

  @override
  Widget build(BuildContext context) {
    // Récupère les données du sujet de leçon spécifique.
    final LessonTopic lessonTopic;
    try {
      lessonTopic = schoolClasses
          .firstWhere((c) => c.id == classId)
          .chapters
          .firstWhere((ch) => ch.id == chapterId)
          .lessonTopics
          .firstWhere((t) => t.id == topicId);
    } catch (e) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Erreur : Leçon non trouvée.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lessonTopic.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: lessonTopic.content.length,
        itemBuilder: (context, index) {
          // Construit le widget approprié pour chaque élément de contenu.
          return _buildContentItem(context, lessonTopic.content[index]);
        },
      ),
    );
  }

  /// Construit le widget correspondant au type de `ContentItem`.
  /// Cette fonction est récursive pour gérer le contenu imbriqué (ex: dans les boîtes).
  Widget _buildContentItem(BuildContext context, ContentItem item) {
    return switch (item) {
      Heading(text: final t) => HeadingWidget(t),
      Paragraph(text: final t) => ParagraphWidget(t),
      MathFormula(formula: final f) => MathFormulaView(f),
      Definition(content: final c) => DefinitionBox(
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
      ) => ContentTableView(tableData: ContentTable(headers: h, rows: r, caption: c)),
      ContentImage(assetPath: final p) => ContentImageView(assetPath: p),
    };
  }
}
