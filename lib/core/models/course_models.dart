import 'package:flutter/foundation.dart';

// --- Core Content Items ---
// These models represent the smallest pieces of content in a lesson.
// They are unchanged from the previous version as they are fundamental.

@immutable
sealed class ContentItem {
  const ContentItem();
}

class Heading extends ContentItem {
  final String text;
  const Heading(this.text);
}

class Paragraph extends ContentItem {
  final String text;
  const Paragraph(this.text);
}

class Definition extends ContentItem {
  final List<ContentItem> content;
  const Definition({required this.content});
}

class Example extends ContentItem {
  final List<ContentItem> content;
  const Example({required this.content});
}

class MathFormula extends ContentItem {
  final String formula;
  const MathFormula(this.formula);
}

class ContentImage extends ContentItem {
  final String assetPath;
  const ContentImage(this.assetPath);
}

class ContentTable extends ContentItem {
  final List<String> headers;
  final List<List<String>> rows;
  final String? caption;
  const ContentTable({required this.headers, required this.rows, this.caption});
}

class Correction extends ContentItem {
    final List<ContentItem> content;
    const Correction({required this.content});
}


// --- New Hierarchical Models ---
// These models provide the new structure for Classes -> Chapters -> Topics.

/// Represents a specific topic within a chapter's lesson.
/// e.g., "Limite en un point" is a topic within the "Limites" chapter.
@immutable
class LessonTopic {
  final String id;
  final String title;
  final List<ContentItem> content;
  final bool isAvailable;

  const LessonTopic({
    required this.id,
    required this.title,
    this.content = const [],
    this.isAvailable = false,
  });
}

/// Represents a major chapter in the curriculum.
/// e.g., "Nombres Complexes"
@immutable
class Chapter {
  final String id;
  final String title;
  final List<LessonTopic> lessonTopics;
  final bool hasExercises;

  const Chapter({
    required this.id,
    required this.title,
    this.lessonTopics = const [],
    this.hasExercises = false,
  });
}

/// Represents a school class level.
/// e.g., "Terminale S1"
@immutable
class SchoolClass {
  final String id;
  final String name;
  final String description;
  final List<Chapter> chapters;

  const SchoolClass({
    required this.id,
    required this.name,
    required this.description,
    this.chapters = const [],
  });
}
