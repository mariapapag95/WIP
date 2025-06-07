class Task {
  final int id;
  String title;
  String? details;
  DateTime? time;
  TaskStatus status;

  Task({
    required this.id,
    required this.title,
    this.details,
    this.time,
    this.status = TaskStatus.toDo,
  });

  List<String> toCsvRow() => [
        id.toString(),
        title,
        details ?? '',
        time?.millisecondsSinceEpoch.toString() ?? '',
        status.name,
      ];

  static Task fromCsvRow(List<String> row) {
    return Task(
      id: int.parse(row[0]),
      title: row[1],
      details: row[2].isEmpty ? null : row[2],
      time: row[3].isEmpty
          ? null
          : DateTime.fromMillisecondsSinceEpoch(int.parse(row[3])),
      status: TaskStatus.values.firstWhere((e) => e.name == row[4]),
    );
  }
}

enum TaskStatus {
  toDo('To do'),
  inProgress('In progress'),
  blocked('Blocked'),
  done('Done'),
  canceled('canceled'),
  // Blank on purpose
  // Does not get displayed to the user
  deleted('');

  const TaskStatus(this.label);
  final String label;
}
