import 'package:flutter/material.dart';

import '../../models/task.dart';

class StatusDropdown extends StatelessWidget {
  const StatusDropdown({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  final TaskStatus? initialValue;
  final ValueChanged<TaskStatus?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: initialValue,
      items: TaskStatus.values
          .where((s) => s != TaskStatus.deleted)
          .map(
            (s) => DropdownMenuItem(
              value: s,
              child: Text(s.label),
            ),
          )
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(labelText: 'Status'),
    );
  }
}
