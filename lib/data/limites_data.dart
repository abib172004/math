import '../models/course_models.dart';

/// Contenu du chapitre sur les limites pour les séries S1 & S2.
/// Ce fichier contient les données structurées du cours.
final limitesChapterS1S2 = CourseChapter(
  id: 'limites-s1-s2',
  title: 'Limite d’une fonction',
  series: 'S1 & S2',
  sections: [
    CourseSection(
      title: 'Limite d’une fonction en un point',
      content: [
        Heading('Limite infinie'),
        Paragraph('Soit f une fonction (en classe de Terminale, on se limite aux fonctions réelles) d’ensemble de définition Df. Soit a un réel appartenant à Df ou étant une borne de Df.'),
        Definition(content: [
          Paragraph('On dit que f **tend vers +∞** quand x tend vers a si f(x) est aussi grand que l’on veut pourvu que x soit suffisamment proche de a.'),
        ]),
        MathFormula(r'\lim_{x \to a} f(x) = +\infty'),
        Example(content: [
          Paragraph(r'La fonction f définie sur ℝ* par f(x) = 1/x², tend vers +∞ quand x tend vers 0.'),
          MathFormula(r'f(x) = \frac{1}{x^2}')
        ]),
        ContentImage('assets/images/limite_infinie_point.png'),
        Paragraph('Il est tout à fait possible d’établir une définition similaire pour une fonction tendant vers -∞ en un point.'),
        Definition(content: [
          Paragraph('On dit que f **tend vers -∞** quand x tend vers a si f(x) est aussi petit que l’on veut pourvu que x suffisamment proche de a.'),
        ]),
        MathFormula(r'\lim_{x \to a} f(x) = -\infty'),
        Example(content: [
          Paragraph(r'La fonction f définie sur ℝ* par f(x) = -1/x², tend vers -∞ quand x tend vers 0.'),
          MathFormula(r'f(x) = -\frac{1}{x^2}')
        ]),
        Heading('Limite finie'),
        Definition(content: [
          Paragraph('Soit f une fonction d’ensemble de définition Df. Soit a un réel appartenant à Df ou étant une borne de Df.'),
          Paragraph('On dit que f **tend vers L** quand x tend vers a si f(x) est aussi proche de L que l’on veut pourvu que x soit suffisamment proche de a.'),
        ]),
        MathFormula(r'\lim_{x \to a} f(x) = L'),
        Example(content: [
          Paragraph(r'La fonction f définie sur ℝ par f(x) = x + 2, tend vers 3 quand x tend vers 1.'),
          Paragraph(r'Remarque : cette limite n’est pas triviale à démontrer. On peut cependant en proposer une preuve à l’aide de la dérivée de la fonction f (qui est f\'(x) = 1) :'),
          MathFormula(r'\lim_{x \to 1} (x+2) = 1+2 = 3'),
        ]),
        ContentImage('assets/images/limite_finie_point.png'),
        Heading('Limites à gauche et à droite'),
        Definition(content: [
          Paragraph('Soit f une fonction. On dit que f admet une **limite à gauche** en a si f admet une limite quand x tend vers a avec x < a. On la note :'),
          MathFormula(r'\lim_{x \to a^-} f(x)'),
          Paragraph('On dit que f admet une **limite à droite** en a si f admet une limite quand x tend vers a avec x > a. On la note :'),
          MathFormula(r'\lim_{x \to a^+} f(x)'),
        ]),
        Example(content: [
          Paragraph(r'La fonction f définie sur ℝ* par f(x) = 1/x, admet deux limites différentes à gauche et à droite de 0 :'),
          MathFormula(r'\lim_{x \to 0^-} \frac{1}{x} = -\infty \quad \text{et} \quad \lim_{x \to 0^+} \frac{1}{x} = +\infty'),
        ]),
        Heading('Asymptote verticale'),
        Definition(content: [
          Paragraph('Si f admet une limite infinie quand x tend vers a, alors la droite d’équation x = a est une **asymptote verticale** à la courbe représentative de f.'),
          MathFormula('x = a'),
        ]),
        Example(content: [
          Paragraph(r'Les courbes des fonctions f(x) = 1/x² et f(x) = 1/x admettent une asymptote verticale d’équation x = 0.'),
        ]),
      ],
    ),
    CourseSection(
      title: 'Limite d’une fonction en l’infini',
      content: [
        Heading('Limite infinie'),
        Definition(content: [
          Paragraph('On dit que f **tend vers +∞** en +∞ si f(x) est aussi grand que l’on veut pourvu que x soit suffisamment grand.'),
        ]),
        Paragraph('Des définitions similaires existent pour les limites en -∞, ou tendant vers -∞.'),
        Example(content: [
          Paragraph(r'La fonction f(x) = x² tend vers +∞ quand x tend vers +∞. La fonction f(x) = -x² tend vers -∞ quand x tend vers +∞.'),
        ]),
        Heading('Limite finie'),
        Definition(content: [
          Paragraph('On dit que f **tend vers L** quand x tend vers +∞ si f(x) est aussi proche de L que l’on veut pourvu que x soit suffisamment grand.'),
        ]),
        Example(content: [
          Paragraph(r'La fonction f définie sur ℝ* par f(x) = 1/x, tend vers 0 quand x tend vers +∞ et -∞.'),
          MathFormula(r'\lim_{x \to \pm\infty} \frac{1}{x} = 0'),
        ]),
        ContentImage('assets/images/asymptote_horizontale.png'),
        Heading('Asymptote horizontale'),
        Definition(content: [
          Paragraph('Si f admet une limite finie L quand x tend vers ±∞, alors la droite d’équation y = L est une **asymptote horizontale** à la courbe de f.'),
          MathFormula('y = L'),
        ]),
        Example(content: [
          Paragraph(r'La courbe de f(x) = 1/x admet une asymptote horizontale d’équation y = 0 en +∞ et en -∞.'),
        ]),
      ],
    ),
    CourseSection(
      title: 'Calcul de limites',
      content: [
        Heading('Opérations sur les limites'),
        Paragraph('Les tableaux suivants résument les opérations sur les limites. "F.I." signifie "Forme Indéterminée".'),
        ContentTable(
          caption: 'Limite d’une somme',
          headers: ['lim f(x)', 'lim g(x)', 'lim f(x) + g(x)'],
          rows: [
            ['L', 'L\'', 'L + L\''],
            ['L', '+∞', '+∞'],
            ['L', '-∞', '-∞'],
            ['+∞', '+∞', '+∞'],
            ['-∞', '-∞', '-∞'],
            ['+∞', '-∞', 'F.I.'],
          ],
        ),
        ContentTable(
          caption: 'Limite d’un produit',
          headers: ['lim f(x)', 'lim g(x)', 'lim f(x) × g(x)'],
          rows: [
            ['L', 'L\'', 'L × L\''],
            ['L ≠ 0', '∞', '∞ (règle des signes)'],
            ['∞', '∞', '∞ (règle des signes)'],
            ['0', '∞', 'F.I.'],
          ],
        ),
        ContentTable(
          caption: 'Limite d’un quotient',
          headers: ['lim f(x)', 'lim g(x)', 'lim f(x) / g(x)'],
          rows: [
            ['L', 'L\' ≠ 0', 'L / L\''],
            ['L ≠ 0', '0', '∞ (règle des signes)'],
            ['L', '∞', '0'],
            ['∞', 'L', '∞ (règle des signes)'],
            ['∞', '∞', 'F.I.'],
            ['0', '0', 'F.I.'],
          ],
        ),
        Heading('Formes indéterminées'),
        Paragraph('Il existe 4 formes indéterminées principales :'),
        MathFormula(r'+\infty - \infty, \quad 0 \times \infty, \quad \frac{\infty}{\infty}, \quad \frac{0}{0}'),
        Heading('Théorèmes de comparaison'),
        Definition(content: [
          Paragraph('Si lim f(x) = +∞ et si f(x) ≤ g(x), alors lim g(x) = +∞.'),
          Paragraph('Si lim f(x) = -∞ et si f(x) ≥ g(x), alors lim g(x) = -∞.'),
        ]),
        Heading('Théorème des gendarmes'),
        Definition(content: [
          Paragraph('Si g(x) ≤ f(x) ≤ h(x) et si lim g(x) = lim h(x) = L, alors lim f(x) = L.'),
        ]),
        Example(content: [
          Paragraph('Pour montrer que lim sin(x)/x = 0 en +∞ :'),
          Paragraph('On sait que -1 ≤ sin(x) ≤ 1. Pour x > 0, on a :'),
          MathFormula(r'-\frac{1}{x} \le \frac{\sin(x)}{x} \le \frac{1}{x}'),
          Paragraph('Comme lim(-1/x) = lim(1/x) = 0 en +∞, alors par le théorème des gendarmes :'),
          MathFormula(r'\lim_{x \to +\infty} \frac{\sin(x)}{x} = 0'),
        ]),
        Heading('Croissances comparées'),
        Definition(content: [
          Paragraph('Pour tout n > 0 :'),
          MathFormula(r'\lim_{x \to +\infty} \frac{e^x}{x^n} = +\infty \quad \text{et} \quad \lim_{x \to +\infty} \frac{\ln(x)}{x^n} = 0'),
        ]),
        Correction(content: [
            Paragraph(r"Démonstration pour e^x / x^n :"),
            Paragraph(r"Posons g(x) = e^x - x - 1. On a g'(x) = e^x - 1, qui est positif pour x ≥ 0. Donc g est croissante sur [0, +∞[ et son minimum est g(0) = 0. Ainsi, pour x ≥ 0, e^x ≥ x + 1."),
            Paragraph(r"En utilisant un changement de variable et des manipulations, on peut étendre ce résultat pour montrer la croissance comparée."),
        ]),
      ],
    ),
     CourseSection(
      title: 'Asymptote oblique',
      content: [
        Definition(content: [
            Paragraph(r"Soit f une fonction. Si lim(x→±∞) [f(x) - (mx + p)] = 0, où m et p sont des réels (m ≠ 0), alors la droite d’équation y = mx + p est une **asymptote oblique** à la courbe de f."),
        ]),
        Heading('Comment trouver une asymptote oblique ?'),
        Paragraph('Il faut et il suffit que :'),
        MathFormula(r'1. \quad \lim_{x \to \pm\infty} \frac{f(x)}{x} = m \quad (m \neq 0)'),
        MathFormula(r'2. \quad \lim_{x \to \pm\infty} [f(x) - mx] = p'),
        Example(content: [
            Paragraph(r'Considérons la fonction f(x) = (x² + 1) / x.'),
            MathFormula(r'1. \quad \lim_{x\to+\infty} \frac{f(x)}{x} = \lim_{x\to+\infty} \frac{x^2+1}{x^2} = 1 \quad (m=1)'),
            MathFormula(r'2. \quad \lim_{x\to+\infty} [f(x) - x] = \lim_{x\to+\infty} \frac{1}{x} = 0 \quad (p=0)'),
            Paragraph(r'La droite d’équation y = x est une asymptote oblique à la courbe de f en +∞.'),
        ]),
      ],
    ),
  ],
);
