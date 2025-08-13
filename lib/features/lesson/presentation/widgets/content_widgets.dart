import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../../../core/models/course_models.dart';

// A collection of widgets used to render different types of lesson content.

// --- Basic Content Widgets ---

class HeadingWidget extends StatelessWidget {
  final String text;
  const HeadingWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class ParagraphWidget extends StatelessWidget {
  final String text;
  const ParagraphWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final parts = text.split('**');
    final spans = <TextSpan>[];
    for (var i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: i.isOdd ? const TextStyle(fontWeight: FontWeight.bold) : null,
      ));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
          children: spans,
        ),
      ),
    );
  }
}

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
          textStyle: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSurface),
          onErrorFallback: (err) => Text('Erreur de formule', style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ),
      ),
    );
  }
}

class ContentImageView extends StatelessWidget {
  final String assetPath;
  const ContentImageView({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Image.asset(
        assetPath,
        errorBuilder: (context, error, stackTrace) => Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey.shade200,
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.image_not_supported_outlined, color: Colors.grey),
            SizedBox(width: 8),
            Text("Graphique bientôt disponible"),
          ]),
        ),
      ),
    );
  }
}


// --- Styled Box Widgets ---

class DefinitionBox extends StatelessWidget {
  final List<Widget> children;
  const DefinitionBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return _StyledBox(
      title: 'Définition',
      icon: Icons.lightbulb_outline,
      color: Theme.of(context).colorScheme.primary,
      children: children,
    );
  }
}

class ExampleBox extends StatelessWidget {
  final List<Widget> children;
  const ExampleBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return _StyledBox(
      title: 'Exemple',
      icon: Icons.edit_note_outlined,
      color: Theme.of(context).colorScheme.secondary,
      children: children,
    );
  }
}

class CorrectionBox extends StatelessWidget {
  final List<Widget> children;
  const CorrectionBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return _StyledBox(
      title: 'Correction',
      icon: Icons.check_circle_outline,
      color: Colors.green.shade700,
      children: children,
    );
  }
}


// --- Table Widget ---

class ContentTableView extends StatelessWidget {
  final ContentTable tableData;
  const ContentTableView({super.key, required this.tableData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (tableData.caption != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(tableData.caption!, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 38,
              headingRowHeight: 40,
              headingRowColor: MaterialStateProperty.all(theme.colorScheme.primary.withOpacity(0.1)),
              columns: tableData.headers.map((h) => DataColumn(label: Text(h, style: const TextStyle(fontWeight: FontWeight.bold)))).toList(),
              rows: tableData.rows.map((rowData) => DataRow(cells: rowData.map((cell) => DataCell(Center(child: Text(cell)))).toList())).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


// --- Private Base Widget for Styled Boxes ---

class _StyledBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Widget> children;

  const _StyledBox({
    required this.title,
    required this.icon,
    required this.color,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        border: Border(left: BorderSide(color: color, width: 4.0)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
          ]),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}
