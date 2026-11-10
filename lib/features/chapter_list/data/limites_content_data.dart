import '../../../core/models/course_models.dart';

/// Contient les données de contenu détaillées pour le sous-chapitre "Limites".
/// Ce contenu est destiné aux élèves de terminale pour comprendre les limites de fonctions.
/// Les explications sont simplifiées avec des analogies, des exemples clairs, des tables de valeurs et des astuces pour éviter les erreurs fréquentes.
final List<ContentItem> limitesContent = [
  // --- Introduction aux limites ---
  Heading('Introduction aux limites'),
  Paragraph('Une limite décrit ce que fait une fonction quand x se rapproche d’un point ou devient très grand (vers l’infini). C’est comme suivre une voiture : où va-t-elle quand elle est près d’un endroit précis ou quand elle s’éloigne très loin ?'),
  Paragraph('Astuce : Les limites parlent de ce qui se passe autour d’un point ou très loin, pas exactement au point.'),

  // --- Limite en un point ---
  Heading('Limite infinie en un point'),
  Paragraph('Quand une fonction devient "immense" (positive ou négative) près d’un point a, elle tend vers +∞ ou -∞. Imagine une fusée qui monte très haut près du point de lancement.'),
  Definition(content: [
    Paragraph('f(x) tend vers +∞ quand x → a si f(x) devient aussi grand que l’on veut en se rapprochant de a.'),
    MathFormula(r'\lim_{x \to a} f(x) = +\infty')
  ]),
  Example(content: [
    Paragraph('Prenons f(x) = 1/x². Quand x se rapproche de 0 (sans l’atteindre), 1/x² devient énorme.'),
    MathFormula(r'f(x) = \frac{1}{x^2}, \quad \lim_{x \to 0} \frac{1}{x^2} = +\infty'),
    Paragraph('Erreur fréquente : Ne divise pas par 0 ! La limite regarde ce qui se passe près de 0, pas à 0.')
  ]),

  Heading('Limite finie en un point'),
  Paragraph('Quand une fonction s’approche d’une valeur précise L près d’un point a, elle a une limite finie L. C’est comme marcher vers une maison : tu t’en approches sans forcément entrer.'),
  Definition(content: [
    Paragraph('f(x) tend vers L quand x → a si f(x) devient aussi proche de L que l’on veut.'),
    MathFormula(r'\lim_{x \to a} f(x) = L')
  ]),
  Example(content: [
    Paragraph('Prenons f(x) = x + 2. Quand x → 1, f(x) → 3.'),
    MathFormula(r'\lim_{x \to 1} (x + 2) = 1 + 2 = 3'),
    Paragraph('Astuce : Teste avec x = 1.1 ou x = 0.9 pour voir que f(x) se rapproche de 3.')
  ]),

  Heading('Limites à gauche et à droite'),
  Paragraph('Une fonction peut se comporter différemment selon qu’on approche un point par la gauche (x < a) ou par la droite (x > a). C’est comme une rivière avec un barrage : l’eau peut être haute d’un côté et basse de l’autre.'),
  Definition(content: [
    Paragraph('La limite à gauche est la valeur de f(x) quand x → a avec x < a.'),
    MathFormula(r'\lim_{x \to a^-} f(x)'),
    Paragraph('La limite à droite est la valeur de f(x) quand x → a avec x > a.'),
    MathFormula(r'\lim_{x \to a^+} f(x)')
  ]),
  Example(content: [
    Paragraph('Pour f(x) = 1/x près de x = 0:'),
    MathFormula(r'\lim_{x \to 0^-} \frac{1}{x} = -\infty \quad \text{(x négatif, donc } \frac{1}{x} \text{ négatif)}'),
    MathFormula(r'\lim_{x \to 0^+} \frac{1}{x} = +\infty \quad \text{(x positif)}'),
    Paragraph('Erreur fréquente : Vérifie si x est positif ou négatif de chaque côté.')
  ]),

  Heading('Asymptote verticale'),
  Paragraph('Si une fonction tend vers +∞ ou -∞ en un point a, la droite x = a est une asymptote verticale. C’est comme un mur que la courbe approche sans jamais toucher.'),
  Definition(content: [
    Paragraph('Si lim(x→a) f(x) = ±∞, alors x = a est une asymptote verticale.')
  ]),
  Example(content: [
    Paragraph('Pour f(x) = 1/x², lim(x→0) 1/x² = +∞, donc x = 0 est une asymptote verticale.')
  ]),

  // --- Limite en l’infini ---
  Heading('Limite en l’infini'),
  Paragraph('Quand x devient très grand (x → +∞) ou très petit (x → -∞), on regarde ce que fait f(x). C’est comme observer une voiture s’éloigner : elle peut disparaître (tendre vers 0) ou rester à une certaine hauteur.'),
  Definition(content: [
    Paragraph('f(x) tend vers L quand x → +∞ si f(x) devient aussi proche de L que l’on veut pour x très grand.'),
    MathFormula(r'\lim_{x \to +\infty} f(x) = L')
  ]),
  Example(content: [
    Paragraph('Pour f(x) = 1/x, quand x → +∞, 1/x → 0.'),
    MathFormula(r'\lim_{x \to +\infty} \frac{1}{x} = 0'),
    Paragraph('Astuce : Essaye x = 100, 1000, 10000 pour voir que 1/x devient très petit.')
  ]),

  Heading('Asymptote horizontale'),
  Paragraph('Si une fonction tend vers une valeur finie L quand x → ±∞, la droite y = L est une asymptote horizontale. C’est comme une ligne d’horizon que la courbe suit à l’infini.'),
  Definition(content: [
    Paragraph('Si lim(x→±∞) f(x) = L, alors y = L est une asymptote horizontale.')
  ]),
  Example(content: [
    Paragraph('Pour f(x) = 1/x, lim(x→+∞) 1/x = 0, donc y = 0 est une asymptote horizontale.')
  ]),

  // --- Calcul de limites ---
  Heading('Calcul de limites'),
  Paragraph('On utilise des règles pour calculer les limites des sommes, produits et quotients. Attention aux formes indéterminées (F.I.), comme 0/0 ou ∞/∞, qui demandent un travail supplémentaire.'),
  ContentTable(
    caption: 'Limite d’une somme',
    headers: ['lim f(x)', 'lim g(x)', 'lim (f(x) + g(x))'],
    rows: [
      ['L', 'L\'', 'L + L\''],
      ['L', '+∞', '+∞'],
      ['L', '-∞', '-∞'],
      ['+∞', '+∞', '+∞'],
      ['-∞', '-∞', '-∞'],
      ['+∞', '-∞', 'F.I. (à analyser)']
    ]
  ),
  ContentTable(
    caption: 'Limite d’un produit',
    headers: ['lim f(x)', 'lim g(x)', 'lim (f(x) × g(x))'],
    rows: [
      ['L', 'L\'', 'L × L\''],
      ['L ≠ 0', '±∞', '±∞ (selon les signes)'],
      ['±∞', '±∞', '±∞ (selon les signes)'],
      ['0', '±∞', 'F.I. (à analyser)']
    ]
  ),
  ContentTable(
    caption: 'Limite d’un quotient',
    headers: ['lim f(x)', 'lim g(x)', 'lim (f(x) / g(x))'],
    rows: [
      ['L', 'L\' ≠ 0', 'L / L\''],
      ['L ≠ 0', '0', '±∞ (selon les signes)'],
      ['L', '±∞', '0'],
      ['±∞', 'L', '±∞ (selon les signes)'],
      ['±∞', '±∞', 'F.I.'],
      ['0', '0', 'F.I.']
    ]
  ),
  Paragraph('Astuce : Si tu rencontres une forme indéterminée, essaye de simplifier l’expression (voir section suivante).'),

  Heading('Limite d’une composée'),
  Paragraph('Quand une fonction est composée (f(g(x))), la limite suit une règle en chaîne, comme passer un relais.'),
  Definition(content: [
    Paragraph('Si lim(x→a) g(x) = b et lim(y→b) f(y) = L, alors :'),
    MathFormula(r'\lim_{x \to a} f(g(x)) = L')
  ]),
  Example(content: [
    Paragraph('Pour f(y) = y² et g(x) = x + 1, si x → 1, alors g(x) → 2, et f(2) = 4.'),
    MathFormula(r'\lim_{x \to 1} (x + 1)^2 = 4')
  ]),

  // --- Résolution des formes indéterminées ---
  Heading('Résolution des formes indéterminées'),
  Paragraph('Les formes indéterminées (0/0 ou ∞/∞) arrivent quand les règles classiques ne marchent pas. C’est comme un puzzle : il faut réorganiser les pièces pour trouver la solution.'),
  Paragraph('Les deux formes les plus fréquentes sont :'),
  Paragraph('1. 0/0 : Numérateur et dénominateur tendent vers 0.'),
  Paragraph('2. ∞/∞ : Numérateur et dénominateur tendent vers l’infini.'),
  Paragraph('Méthode principale : Simplifie l’expression par factorisation ou division.'),
  Example(content: [
    Paragraph('Exemple 1 (0/0) : Trouver lim(x→0) x²/x.'),
    Paragraph('Étape 1 : Vérifie la forme. Si x = 0, numérateur = 0² = 0 et dénominateur = 0, donc 0/0.'),
    Paragraph('Étape 2 : Simplifie l’expression. Puisque x²/x = x (pour x ≠ 0), la limite devient :'),
    MathFormula(r'\lim_{x \to 0} x = 0'),
    Paragraph('Vérification : Teste x = 0.1 (0.01/0.1 = 0.1) et x = -0.1 (0.01/-0.1 = -0.1), qui tendent vers 0.'),
    Paragraph('Astuce : Factorise ou simplifie toujours avant de conclure.')
  ]),
  Example(content: [
    Paragraph('Exemple 2 (0/0) : Trouver lim(x→1) (x² - 1)/(x - 1).'),
    Paragraph('Étape 1 : Vérifie. Si x = 1, numérateur = 1² - 1 = 0, dénominateur = 1 - 1 = 0, donc 0/0.'),
    Paragraph('Étape 2 : Factorise le numérateur : x² - 1 = (x - 1)(x + 1).'),
    MathFormula(r'\frac{x^2 - 1}{x - 1} = \frac{(x - 1)(x + 1)}{x - 1} = x + 1 \quad (x \neq 1)'),
    Paragraph('Étape 3 : Calcule la limite.'),
    MathFormula(r'\lim_{x \to 1} (x + 1) = 1 + 1 = 2'),
    Paragraph('Erreur fréquente : Ne dis pas 0/0 = 0. Simplifie d’abord !')
  ]),
  Example(content: [
    Paragraph('Exemple 3 (∞/∞) : Trouver lim(x→+∞) (3x + 5)/(2x - 1).'),
    Paragraph('Étape 1 : Vérifie. Quand x → +∞, numérateur → +∞, dénominateur → +∞, donc ∞/∞.'),
    Paragraph('Étape 2 : Divise numérateur et dénominateur par x (le plus haut degré).'),
    MathFormula(r'\frac{3x + 5}{2x - 1} = \frac{\frac{3x}{x} + \frac{5}{x}}{\frac{2x}{x} - \frac{1}{x}} = \frac{3 + \frac{5}{x}}{2 - \frac{1}{x}}'),
    Paragraph('Étape 3 : Quand x → +∞, 5/x → 0, 1/x → 0.'),
    MathFormula(r'\lim_{x \to +\infty} \frac{3 + \frac{5}{x}}{2 - \frac{1}{x}} = \frac{3 + 0}{2 - 0} = \frac{3}{2}'),
    Paragraph('Astuce : Pour ∞/∞, divise toujours par la plus haute puissance de x.')
  ]),
  Paragraph('Mini-exercices : Essaye de calculer :'),
  Paragraph('1. lim(x→2) (x² - 4)/(x - 2) (factorise).'),
  Paragraph('2. lim(x→+∞) (5x² + 2)/(2x² - 3) (divise par x²).'),
  Paragraph('Erreur fréquente : Ne saute pas les étapes de simplification. Vérifie toujours la forme avant de conclure.'),

  // --- Limites usuelles ---
  Heading('Limites usuelles'),
  Paragraph('Certaines limites sont essentielles à mémoriser pour le programme de terminale. Elles sont organisées par catégorie.'),

  Paragraph('**Limites trigonométriques**'),
  Definition(content: [
    Paragraph('1. lim(x→0) sin(x)/x = 1.'),
    MathFormula(r'\lim_{x \to 0} \frac{\sin(x)}{x} = 1'),
    Paragraph('2. lim(x→0) (1 - cos(x))/x = 0.'),
    MathFormula(r'\lim_{x \to 0} \frac{1 - \cos(x)}{x} = 0'),
    Paragraph('3. lim(x→0) tan(x)/x = 1.'),
    MathFormula(r'\lim_{x \to 0} \frac{\tan(x)}{x} = 1'),
    Paragraph('4. lim(x→0) (sin(x) - x)/x³ = 0.'),
    MathFormula(r'\lim_{x \to 0} \frac{\sin(x) - x}{x^3} = 0')
  ]),

  Paragraph('**Limites polynomiales et rationnelles**'),
  Definition(content: [
    Paragraph('1. lim(x→+∞) 1/x = 0 (et aussi pour x → -∞).'),
    MathFormula(r'\lim_{x \to +\infty} \frac{1}{x} = 0'),
    Paragraph('2. Comportement de xⁿ quand x → ±∞ :'),
    Paragraph('- Si n pair, lim(x→+∞) xⁿ = +∞ et lim(x→-∞) xⁿ = +∞.'),
    MathFormula(r'\lim_{x \to +\infty} x^n = +\infty \quad (n \text{ pair}), \quad \lim_{x \to -\infty} x^n = +\infty \quad (n \text{ pair})'),
    Paragraph('- Si n impair, lim(x→+∞) xⁿ = +∞ et lim(x→-∞) xⁿ = -∞.'),
    MathFormula(r'\lim_{x \to +\infty} x^n = +\infty \quad (n \text{ impair}), \quad \lim_{x \to -\infty} x^n = -\infty \quad (n \text{ impair})'),
    Paragraph('3. Comportement de 1/xⁿ quand x → ±∞ :'),
    Paragraph('- Si n pair, lim(x→±∞) 1/xⁿ = 0.'),
    MathFormula(r'\lim_{x \to \pm\infty} \frac{1}{x^n} = 0 \quad (n \text{ pair})'),
    Paragraph('- Si n impair, lim(x→+∞) 1/xⁿ = 0, mais lim(x→-∞) 1/xⁿ n’est pas défini.'),
    MathFormula(r'\lim_{x \to +\infty} \frac{1}{x^n} = 0 \quad (n \text{ impair})')
  ]),

  Paragraph('**Limites avec racines**'),
  Definition(content: [
    Paragraph('1. lim(x→+∞) √x = +∞, mais lim(x→-∞) √x n’est pas défini.'),
    MathFormula(r'\lim_{x \to +\infty} \sqrt{x} = +\infty'),
    Paragraph('2. lim(x→+∞) 1/√x = 0, mais lim(x→-∞) 1/√x n’est pas défini.'),
    MathFormula(r'\lim_{x \to +\infty} \frac{1}{\sqrt{x}} = 0')
  ]),

  Paragraph('Erreur fréquente : Oublier la parité de n ou les cas non définis pour les racines.'),

  // --- Comparaisons et encadrements ---
  Heading('Comparaisons et encadrements'),
  Paragraph('Ces théorèmes aident à trouver des limites en comparant une fonction à d’autres plus simples.'),
  Heading('Théorèmes de comparaison'),
  Definition(content: [
    Paragraph('Si f(x) ≤ g(x) et lim(x→a) f(x) = +∞, alors lim(x→a) g(x) = +∞.'),
    MathFormula(r'\lim_{x \to a} f(x) = +\infty \text{ et } f(x) \leq g(x) \implies \lim_{x \to a} g(x) = +\infty'),
    Paragraph('Si f(x) ≥ g(x) et lim(x→a) f(x) = -∞, alors lim(x→a) g(x) = -∞.'),
    MathFormula(r'\lim_{x \to a} f(x) = -\infty \text{ et } f(x) \geq g(x) \implies \lim_{x \to a} g(x) = -\infty')
  ]),
  Example(content: [
    Paragraph('Pour f(x) = x² et g(x) = x² + x, comme x² ≤ x² + x et lim(x→+∞) x² = +∞, alors :'),
    MathFormula(r'\lim_{x \to +\infty} (x^2 + x) = +\infty')
  ]),

  Heading('Théorème des gendarmes'),
  Paragraph('Si une fonction est coincée entre deux autres qui tendent vers la même limite, elle suit aussi.'),
  Definition(content: [
    Paragraph('Si g(x) ≤ f(x) ≤ h(x) et lim g(x) = lim h(x) = L, alors lim f(x) = L.')
  ]),
  Example(content: [
    Paragraph('Pour lim(x→+∞) sin(x)/x:'),
    Paragraph('On sait que -1 ≤ sin(x) ≤ 1. Donc, pour x > 0:'),
    MathFormula(r'-\frac{1}{x} \leq \frac{\sin(x)}{x} \leq \frac{1}{x}'),
    Paragraph('Comme lim(x→+∞) (-1/x) = 0 et lim(x→+∞) 1/x = 0, alors :'),
    MathFormula(r'\lim_{x \to +\infty} \frac{\sin(x)}{x} = 0'),
    Paragraph('Astuce : Ce théorème est parfait pour les fonctions oscillantes comme sin(x).')
  ]),

  // --- Asymptote oblique ---
  Heading('Asymptote oblique'),
  Paragraph('Une asymptote oblique est une droite inclinée (y = mx + p) que la courbe suit quand x devient très grand. C’est comme une route en pente que la fonction suit de loin à l’infini.'),
  Definition(content: [
    Paragraph('Pour trouver une asymptote oblique, calcule d’abord la pente m avec lim(x→±∞) f(x)/x, puis l’ordonnée p avec lim(x→±∞) [f(x) - mx]. Si lim(x→±∞) [f(x) - (mx + p)] = 0 (avec m ≠ 0), alors y = mx + p est une asymptote oblique.')
  ]),
  Heading('Comment trouver une asymptote oblique ?'),
  Paragraph('Suis ces étapes :'),
  Paragraph('1. Calcule lim(x→±∞) f(x)/x = m (la pente). m doit être non nul.'),
  Paragraph('2. Calcule lim(x→±∞) [f(x) - mx] = p (l’ordonnée à l’origine).'),
  Example(content: [
    Paragraph('Prenons f(x) = (2x² + 3x + 1)/x.'),
    Paragraph('Étape 1 : Trouver m.'),
    MathFormula(r'\lim_{x \to +\infty} \frac{f(x)}{x} = \lim_{x \to +\infty} \frac{2x^2 + 3x + 1}{x^2} = \lim_{x \to +\infty} \left(2 + \frac{3}{x} + \frac{1}{x^2}\right) = 2'),
    Paragraph('Donc, m = 2.'),
    Paragraph('Étape 2 : Trouver p.'),
    MathFormula(r'\lim_{x \to +\infty} [f(x) - 2x] = \lim_{x \to +\infty} \left(\frac{2x^2 + 3x + 1}{x} - 2x\right) = \lim_{x \to +\infty} \frac{3x + 1}{x} = 3'),
    Paragraph('Donc, p = 3.'),
    Paragraph('La droite y = 2x + 3 est une asymptote oblique.')
  ]),
  Paragraph('Erreur fréquente : Si m = 0, c’est une asymptote horizontale, pas oblique. Vérifie la pente !'),
  Paragraph('Astuce : Visualise la courbe et la droite pour voir comment elles se rapprochent.')
];