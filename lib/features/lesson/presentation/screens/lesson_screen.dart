import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/course_models.dart';
import '../../../../core/theme/theme_switcher_button.dart';
import '../../../chapter_list/data/course_data.dart';
import '../widgets/content_widgets.dart';
import '../widgets/expandable_section_widget.dart';

/// Écran qui affiche le contenu détaillé d'une leçon (d'un sujet de leçon).
/// La structure est maintenant organisée en sections dépliables.
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

    // Regroupe le contenu par section (basé sur les `Heading` widgets).
    final groupedContent = _groupContent(lessonTopic.content);

    return Scaffold(
      appBar: AppBar(
        title: Text(lessonTopic.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            tooltip: 'Accueil',
            onPressed: () => context.go('/'),
          ),
          const ThemeSwitcherButton(),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: groupedContent.length,
        itemBuilder: (context, index) {
          final group = groupedContent[index];
          return ExpandableSection(
            title: group.title,
            initiallyExpanded: index == 0, // Ouvre la première section par défaut.
            children: group.items
                .map((item) => _buildContentItem(context, item))
                .toList(),
          );
        },
      ),
    );
  }

  /// Méthode privée pour regrouper le contenu sous des titres.
  List<_ContentGroup> _groupContent(List<ContentItem> content) {
    if (content.isEmpty) return [];

    final List<_ContentGroup> groups = [];
    List<ContentItem> currentItems = [];
    String currentTitle = "Introduction"; // Titre par défaut

    // Gère le cas où le contenu ne commence pas par un titre.
    if (content.first is! Heading) {
       final firstHeadingIndex = content.indexWhere((item) => item is Heading);
       if(firstHeadingIndex == -1) { // No headings at all
          groups.add(_ContentGroup(title: currentTitle, items: content));
          return groups;
       }
    }

    for (final item in content) {
      if (item is Heading) {
        // Si on a un groupe en cours, on le sauvegarde avant d'en créer un nouveau.
        if (currentItems.isNotEmpty) {
          groups.add(_ContentGroup(title: currentTitle, items: currentItems));
        }
        // Commence un nouveau groupe.
        currentTitle = item.text;
        currentItems = [];
      } else {
        currentItems.add(item);
      }
    }

    // Ajoute le dernier groupe en cours.
    if (currentItems.isNotEmpty) {
      groups.add(_ContentGroup(title: currentTitle, items: currentItems));
    }

    return groups;
  }

  /// Construit le widget correspondant au type de `ContentItem`.
  Widget _buildContentItem(BuildContext context, ContentItem item) {
    return switch (item) {
      // Les `Heading` sont déjà utilisés comme titres des sections, on ne les affiche pas ici.
      Heading() => const SizedBox.shrink(),
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

/// Une classe d'aide pour stocker un groupe de contenu.
class _ContentGroup {
  final String title;
  final List<ContentItem> items;
  _ContentGroup({required this.title, required this.items});
}
