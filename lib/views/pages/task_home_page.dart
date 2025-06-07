import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/layout_controller.dart';
import 'package:scrapbook/controllers/theme_controller.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

import '../../controllers/task_controller.dart';
import '../../models/task.dart';
import '../widgets/details_dialog.dart';
import '../widgets/spacers.dart';
import '../widgets/task_form.dart';

class TaskHomePage extends StatelessWidget {
  TaskHomePage({super.key});

  final c = taskController.state;

  void _showAddTaskSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: TaskForm(
          onSave: (task) => c.addOrUpdateTask(task),
        ),
      ),
    );
  }

  void _showTaskDetails(
    BuildContext context, {
    required Task task,
  }) {
    showDialog(
      context: context,
      builder: (_) => TaskDetailsDialog(
        task: task,
        onDelete: () => c.deleteTask(task),
        onSave: (editedTask) => c.addOrUpdateTask(editedTask, isEditing: true),
      ),
    );
  }

  Icon _statusIcon(TaskStatus status) {
    final IconData iconData;
    switch (status) {
      case TaskStatus.toDo:
        iconData = Icons.hourglass_empty;
      case TaskStatus.inProgress:
        iconData = Icons.timelapse;
      case TaskStatus.blocked:
        iconData = Icons.block;
      case TaskStatus.done:
        iconData = Icons.check_circle;
      case TaskStatus.canceled:
        iconData = Icons.cancel;
      default:
        iconData = Icons.help_outline;
    }

    return Icon(iconData, size: Spacers.mediumSize);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => layoutControllerState.selectPage(null),
      child: Scaffold(
        appBar: AppBar(title: const Text('To-Do List')),
        body: taskController.rebuild(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: c.tasks.length,
            itemBuilder: (_, index) {
              final task = c.tasks[index];
              return ListTile(
                selectedTileColor: themeControllerState.theme.splashColor,
                selected: c.selectedTasks.contains(task),
                leading: _statusIcon(task.status),
                title: Text(task.title),
                onLongPress: () => _showTaskDetails(task: task, context),
                onTap: () => c.selectTask(task),
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                horizontalTitleGap: 0,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTaskSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
