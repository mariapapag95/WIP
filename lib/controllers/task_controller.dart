import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../models/task.dart';
import 'csv_service.dart';

var taskController = RM.inject(() => TaskController());
var taskControllerState = taskController.state;

class TaskController {
  // Task home page values
  List<Task> tasks = [];
  List<Task> selectedTasks = [];
  int latestId = 0;

  // Task form values
  final formKey = GlobalKey<FormState>();
  final titleTextController = TextEditingController();
  final detailsTextController = TextEditingController();
  DateTime? time;
  TaskStatus status = TaskStatus.toDo;

  Future<void> loadTasks() async {
    final loadedTasks = await CsvService.loadTasks();
    tasks = loadedTasks.where((t) => t.status != TaskStatus.deleted).toList();
    if (loadedTasks.isNotEmpty) {
      latestId = loadedTasks.map((t) => t.id).reduce((a, b) => a > b ? a : b);
    }
    taskController.notify();
  }

  Future<void> addOrUpdateTask(Task task, {bool isEditing = false}) async {
    if (isEditing) {
      final index = tasks.indexWhere((t) => t.id == task.id);
      tasks[index] = task;
    } else {
      tasks.add(task);
    }
    await CsvService.saveTasks(tasks);
    loadTasks();
    taskController.notify();
  }

  void setTaskFormValues(Task task) {
    titleTextController.text = task.title;
    detailsTextController.text = task.details ?? '';
    time = task.time;
    status = task.status;
    taskController.notify();
  }

  void selectTask(Task task) {
    selectedTasks.contains(task)
        ? selectedTasks.remove(task)
        : selectedTasks.add(task);
    taskController.notify();
  }

  Future<void> deleteTask(Task task) async {
    final index = tasks.indexWhere((t) => t.id == task.id);
    tasks[index].status = TaskStatus.deleted;
    await CsvService.saveTasks(tasks);
    loadTasks();
    taskController.notify();
  }

  void updateTaskStatus({required Task task, required TaskStatus status}) {
    final newTask = Task(
      id: task.id,
      title: task.title,
      details: task.details,
      time: task.time,
      status: status,
    );
    addOrUpdateTask(newTask, isEditing: true);
    taskController.notify();
  }

  bool submit(Task? task) {
    if (!formKey.currentState!.validate()) return false;
    final newTask = Task(
      id: task?.id ?? ++latestId,
      title: titleTextController.text,
      details: detailsTextController.text,
      time: time,
      status: status,
    );

    // Reset form values
    titleTextController.clear();
    detailsTextController.clear();
    time = null;
    status = TaskStatus.toDo;
    taskController.notify();

    addOrUpdateTask(newTask, isEditing: task != null);

    return true;
  }
}
