import '../../../core/models/course_models.dart';
import 'limites_content_data.dart';

// =====================================================================
// ====================    CLASSE DE TERMINALE S1    ===================
// =====================================================================

final _s1Chapters = [
  Chapter(id: 's1-complexes', title: 'Nombres complexes', hasExercises: true),
  Chapter(
    id: 's1-limites-continuite-derivation',
    title: 'Analyse',
    lessonTopics: [
      LessonTopic(id: 's1-limites', title: 'Limites de fonctions', content: limitesContent, isAvailable: true),
      LessonTopic(id: 's1-continuite', title: 'Continuité'),
      LessonTopic(id: 's1-derivation', title: 'Dérivabilité'),
    ],
    hasExercises: true,
  ),
  Chapter(id: 's1-etude-fonctions', title: 'Étude de fonctions'),
  Chapter(id: 's1-logarithme', title: 'Fonction logarithme népérien'),
  Chapter(id: 's1-exponentielle', title: 'Fonction exponentielle'),
  Chapter(id: 's1-suites', title: 'Suites numériques', hasExercises: true),
  Chapter(id: 's1-integrale', title: 'Calcul intégral'),
  Chapter(id: 's1-geometrie-plane', title: 'Géométrie plane'),
  Chapter(id: 's1-arithmetique', title: 'Arithmétique'),
  Chapter(id: 's1-equations-diff', title: 'Équations différentielles'),
  Chapter(id: 's1-produit-vectoriel', title: 'Produit vectoriel – Produit mixte'),
  Chapter(id: 's1-courbes-param', title: 'Notions de courbes paramétrées'),
  Chapter(id: 's1-coniques', title: 'Coniques'),
  Chapter(id: 's1-probabilites', title: 'Probabilités', hasExercises: true),
  Chapter(id: 's1-transformations-espace', title: 'Transformations de l’espace'),
];


// =====================================================================
// ====================    CLASSE DE TERMINALE S2    ===================
// =====================================================================

final _s2Chapters = [
  Chapter(
    id: 's2-limites-continuite-derivabilite',
    title: 'Limites, Continuité, Dérivabilité',
     lessonTopics: [
      LessonTopic(id: 's2-limites', title: 'Limites de fonctions', content: limitesContent, isAvailable: true),
      LessonTopic(id: 's2-continuite', title: 'Continuité'),
      LessonTopic(id: 's2-derivabilite', title: 'Dérivabilité'),
    ],
    hasExercises: true,
  ),
  Chapter(id: 's2-complexes', title: 'Nombres complexes', hasExercises: true),
  Chapter(id: 's2-log-exp', title: 'Logarithme et exponentielle'),
  Chapter(id: 's2-suites', title: 'Suites numériques'),
  Chapter(id: 's2-probabilites', title: 'Probabilités', hasExercises: true),
  Chapter(id: 's2-integrale', title: 'Calcul intégral'),
  Chapter(id: 's2-equations-diff', title: 'Équations différentielles'),
  Chapter(id: 's2-statistiques', title: 'Statistiques'),
];


// =====================================================================
// ====================    DONNÉES PRINCIPALES    ======================
// =====================================================================

/// La liste de toutes les classes disponibles dans l'application.
/// C'est le point d'entrée pour toutes les données de cours.
final List<SchoolClass> schoolClasses = [
  SchoolClass(
    id: 'ts1',
    name: 'Terminale S1',
    description: 'Programme officiel du Sénégal - Série S1 (Scientifique)',
    chapters: _s1Chapters,
  ),
  SchoolClass(
    id: 'ts2',
    name: 'Terminale S2',
    description: 'Programme officiel du Sénégal - Série S2 (Scientifique)',
    chapters: _s2Chapters,
  ),
];
