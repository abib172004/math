import '../../../core/models/course_models.dart';

/// Contient les données de contenu détaillées pour le sous-chapitre "Limites".
/// Ce contenu est ensuite utilisé dans la structure de données principale.
final List<ContentItem> limitesContent = [
  // --- Limite en un point ---
  Heading('Limite infinie en un point'),
  Paragraph('Soit f une fonction et a un réel. On dit que f tend vers +∞ quand x tend vers a si f(x) peut être rendu aussi grand que l’on veut pourvu que x soit suffisamment proche de a.'),
  Definition(content: [ Paragraph('On note :'), MathFormula(r'\lim_{x \to a} f(x) = +\infty') ]),
  Example(content: [ Paragraph(r'La fonction f(x) = 1/x² tend vers +∞ quand x tend vers 0.'), MathFormula(r'f(x) = \frac{1}{x^2}') ]),
  ContentImage('assets/images/limite_infinie_point.png'),

  Heading('Limite finie en un point'),
  Definition(content: [ Paragraph('On dit que f tend vers L quand x tend vers a si f(x) est aussi proche de L que l’on veut pourvu que x soit suffisamment proche de a.'), MathFormula(r'\lim_{x \to a} f(x) = L') ]),
  Example(content: [ Paragraph(r'La fonction f(x) = x + 2 tend vers 3 quand x tend vers 1.'), MathFormula(r'\lim_{x \to 1} (x+2) = 1+2 = 3') ]),
  ContentImage('assets/images/limite_finie_point.png'),

  Heading('Limites à gauche et à droite'),
  Definition(content: [ Paragraph('On dit que f admet une **limite à gauche** en a si f admet une limite quand x tend vers a avec x < a. On la note :'), MathFormula(r'\lim_{x \to a^-} f(x)'), Paragraph('On dit que f admet une **limite à droite** en a si f admet une limite quand x tend vers a avec x > a. On la note :'), MathFormula(r'\lim_{x \to a^+} f(x)') ]),
  Example(content: [ Paragraph(r'La fonction f(x) = 1/x admet deux limites différentes à gauche et à droite de 0 :'), MathFormula(r'\lim_{x \to 0^-} \frac{1}{x} = -\infty \quad \text{et} \quad \lim_{x \to 0^+} \frac{1}{x} = +\infty') ]),

  Heading('Asymptote verticale'),
  Definition(content: [ Paragraph('Si f admet une limite infinie en a, alors la droite d’équation x = a est une asymptote verticale à la courbe de f.') ]),

  // --- Limite en l'infini ---
  Heading('Limite en l’infini'),
  Definition(content: [ Paragraph('On dit que f tend vers L quand x tend vers +∞ si f(x) est aussi proche de L que l’on veut pourvu que x soit suffisamment grand.') ]),
  Example(content: [ Paragraph(r'La fonction f(x) = 1/x tend vers 0 quand x tend vers +∞.'), MathFormula(r'\lim_{x \to +\infty} \frac{1}{x} = 0') ]),
  ContentImage('assets/images/asymptote_horizontale.png'),
  Heading('Asymptote horizontale'),
  Definition(content: [ Paragraph('Si f admet une limite finie L en ±∞, alors la droite d’équation y = L est une asymptote horizontale.') ]),

  // --- Calcul de limites ---
  Heading('Calcul de limites'),
  Paragraph('Voici les opérations sur les limites. "F.I." signifie "Forme Indéterminée".'),
  ContentTable( caption: 'Limite d’une somme', headers: ['lim f(x)', 'lim g(x)', 'lim f(x) + g(x)'], rows: [ ['L', 'L\'', 'L + L\''], ['L', '+∞', '+∞'], ['L', '-∞', '-∞'], ['+∞', '+∞', '+∞'], ['-∞', '-∞', '-∞'], ['+∞', '-∞', 'F.I.'] ]),
  ContentTable( caption: 'Limite d’un produit', headers: ['lim f(x)', 'lim g(x)', 'lim f(x) × g(x)'], rows: [ ['L', 'L\'', 'L × L\''], ['L ≠ 0', '∞', '∞ (règle des signes)'], ['∞', '∞', '∞ (règle des signes)'], ['0', '∞', 'F.I.'] ]),
  ContentTable( caption: 'Limite d’un quotient', headers: ['lim f(x)', 'lim g(x)', 'lim f(x) / g(x)'], rows: [ ['L', 'L\' ≠ 0', 'L / L\''], ['L ≠ 0', '0', '∞ (règle des signes)'], ['L', '∞', '0'], ['∞', 'L', '∞ (règle des signes)'], ['∞', '∞', 'F.I.'], ['0', '0', 'F.I.'] ]),

  Heading('Limite d’une composée'),
  Definition(content: [ Paragraph(r"Si on pose lim(x→a) g(x) = b et lim(y→b) f(y) = L. Alors lim(x→a) f(g(x)) = L.") ]),

  // --- Comparaisons et encadrements ---
  Heading('Comparaisons et encadrements'),
  Heading('Théorèmes de comparaison'),
  Definition(content: [ Paragraph('Si lim(x→a) f(x) = +∞ et si f(x) ≤ g(x), alors lim(x→a) g(x) = +∞.'), Paragraph('Si lim(x→a) f(x) = -∞ et si f(x) ≥ g(x), alors lim(x→a) g(x) = -∞.') ]),
  Heading('Théorème des gendarmes'),
  Definition(content: [ Paragraph('Si g(x) ≤ f(x) ≤ h(x) et si lim g(x) = lim h(x) = L, alors lim f(x) = L.') ]),
  Example(content: [ Paragraph('Pour montrer que lim sin(x)/x = 0 en +∞ :'), Paragraph('On sait que -1 ≤ sin(x) ≤ 1. Pour x > 0 :'), MathFormula(r'-\frac{1}{x} \le \frac{\sin(x)}{x} \le \frac{1}{x}'), Paragraph('Comme les deux fonctions "gendarmes" tendent vers 0, alors :'), MathFormula(r'\lim_{x \to +\infty} \frac{\sin(x)}{x} = 0') ]),

  Heading('Croissances comparées'),
  Definition(content: [ Paragraph('Pour tout n > 0 :'), MathFormula(r'\lim_{x \to +\infty} \frac{e^x}{x^n} = +\infty \quad \text{et} \quad \lim_{x \to +\infty} \frac{\ln(x)}{x^n} = 0') ]),
  Correction(content: [ Paragraph(r"Démonstration pour e^x / x^n :"), Paragraph(r"Posons g(x) = e^x - x - 1. On a g'(x) = e^x - 1, qui est positif pour x ≥ 0. Donc g est croissante sur [0, +∞[ et son minimum est g(0) = 0. Ainsi, pour x ≥ 0, e^x ≥ x + 1."), Paragraph(r"En utilisant un changement de variable et des manipulations, on peut étendre ce résultat pour montrer la croissance comparée.") ]),

  // --- Asymptote oblique ---
  Heading('Asymptote oblique'),
  Definition(content: [ Paragraph(r"Si lim(x→±∞) [f(x) - (mx + p)] = 0, où m et p sont des réels (m ≠ 0), alors la droite d’équation y = mx + p est une **asymptote oblique** à la courbe de f.") ]),
  Heading('Comment trouver une asymptote oblique ?'),
  Paragraph('Il faut et il suffit que :'),
  MathFormula(r'1. \quad \lim_{x \to \pm\infty} \frac{f(x)}{x} = m \quad (m \neq 0)'),
  MathFormula(r'2. \quad \lim_{x \to \pm\infty} [f(x) - mx] = p'),
  Example(content: [ Paragraph(r'Considérons la fonction f(x) = (x² + 1) / x.'), MathFormula(r'1. \quad \lim_{x\to+\infty} \frac{f(x)}{x} = \lim_{x\to+\infty} \frac{x^2+1}{x^2} = 1 \quad (m=1)'), MathFormula(r'2. \quad \lim_{x\to+\infty} [f(x) - x] = \lim_{x\to+\infty} \frac{1}{x} = 0 \quad (p=0)'), Paragraph(r'La droite d’équation y = x est une asymptote oblique à la courbe de f en +∞.') ])
];
