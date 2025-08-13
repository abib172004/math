import 'package:flutter/material.dart';
import '../models/course_models.dart';

/// Un widget pour afficher les données d'un tableau de manière structurée.
/// Utilise le widget `DataTable` de Flutter.
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
          // Affiche le titre du tableau s'il y en a un.
          if (tableData.caption != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                tableData.caption!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          // Le tableau est dans un SingleChildScrollView pour être scrollable
          // horizontalement sur les petits écrans.
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 38,
              headingRowHeight: 40,
              headingRowColor: MaterialStateProperty.all(
                theme.colorScheme.primary.withOpacity(0.1),
              ),
              columns: tableData.headers
                  .map((header) => DataColumn(
                        label: Text(
                          header,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ))
                  .toList(),
              rows: tableData.rows.map((rowData) {
                return DataRow(
                  cells: rowData.map((cell) => DataCell(Center(child: Text(cell)))).toList(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
