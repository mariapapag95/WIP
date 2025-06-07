import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import '../models/task.dart';

class CsvService {
  static const String _fileName = 'tasks_data.csv';

  static Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/$_fileName';
    final file = File(path);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    return file;
  }

  static Future<List<Task>> loadTasks() async {
    try {
      final file = await _getFile();
      final content = await file.readAsString();
      if (content.trim().isEmpty) return [];

      final rows = const CsvToListConverter().convert(content).cast<List<dynamic>>();
      return rows.map((r) => Task.fromCsvRow(r.map((e) => e.toString()).toList())).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> saveTasks(List<Task> tasks) async {
    final file = await _getFile();
    final rows = tasks.map((t) => t.toCsvRow()).toList();
    final csv = const ListToCsvConverter().convert(rows);
    await file.writeAsString(csv);
  }
}