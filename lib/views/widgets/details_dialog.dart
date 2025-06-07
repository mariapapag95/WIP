import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/task_controller.dart';
import 'package:scrapbook/views/widgets/status_dropdown.dart';
import 'package:scrapbook/views/widgets/task_form.dart';

import '../../models/task.dart';

class TaskDetailsDialog extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final Function(Task) onSave;

  const TaskDetailsDialog({
    required this.task,
    required this.onDelete,
    required this.onSave,
    super.key,
  });

  void _edit(BuildContext context) {
    Navigator.of(context).pop();
    taskControllerState.setTaskFormValues(task);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: TaskForm(
          onSave: onSave,
          initialTask: task,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(task.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (task.details != null) Text('Details: ${task.details}'),
          if (task.time != null) Text('Time: ${task.time}'),
          StatusDropdown(
            initialValue: task.status,
            onChanged: (taskStatus) => taskControllerState.updateTaskStatus(
              task: task,
              status: taskStatus!,
            ),
          )
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => _edit(context),
          child: const Text('Edit'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onDelete();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
