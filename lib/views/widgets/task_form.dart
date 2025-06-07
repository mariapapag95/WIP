import 'package:flutter/material.dart';
import 'package:scrapbook/views/widgets/spacers.dart';
import 'package:scrapbook/views/widgets/status_dropdown.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

import '../../controllers/task_controller.dart';
import '../../models/task.dart';

class TaskForm extends StatelessWidget {
  TaskForm({
    super.key,
    required this.onSave,
    this.initialTask,
  });

  final Function(Task) onSave;
  final Task? initialTask;

  final c = taskControllerState;

  void _pickDateTime(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: c.time ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final time = await showTimePicker(
        initialTime: TimeOfDay.fromDateTime(c.time ?? now),
        context: context,
      );
      if (time != null) {
        c.time = DateTime(
            picked.year, picked.month, picked.day, time.hour, time.minute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacers.mediumSize),
      child: taskController.rebuild(
        () => Form(
          key: c.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacers.medium,
              TextFormField(
                controller: c.titleTextController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Title is required' : null,
              ),
              TextFormField(
                controller: c.detailsTextController,
                decoration:
                    const InputDecoration(labelText: 'Details (optional)'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(c.time == null ? 'No Time Selected' : c.time.toString()),
                  TextButton(
                    onPressed: () => _pickDateTime(context),
                    child: const Text('Pick Time'),
                  ),
                ],
              ),
              StatusDropdown(
                initialValue: initialTask?.status,
                onChanged: (TaskStatus? value) => initialTask?.status = value!,
              ),
              Spacers.medium,
              FloatingActionButton(
                onPressed: () {
                  final wasSubmittedSuccessfully = c.submit(initialTask);
                  if (wasSubmittedSuccessfully) Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
              Spacers.xlarge,
            ],
          ),
        ),
      ),
    );
  }
}
