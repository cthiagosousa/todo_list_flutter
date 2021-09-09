import 'package:flutter/material.dart';
import 'package:project/stores/tasks_store.dart';
import 'package:uuid/uuid.dart';
import 'package:project/models/Task.dart';

class HomeController {
  final _tasksStore = TasksStore();
  late String _titleInputValue;

  List<Task> get tasks => _tasksStore.tasks;

  String get titleInputValue => _titleInputValue;

  set titleInputValue(String value) => _titleInputValue = value;

  String titleValidator(String? value) {
    if (value!.isEmpty) {
      return 'O campo não pode ficar vazio';
    }

    return null!;
  }

  void sendForm(GlobalKey<FormState> formKey) {
      formKey.currentState!.save();
      
      final uuid = Uuid();
      final Task task = Task(
        id: uuid.v1(),
        title: titleInputValue,
        isCheck: false,
      );

      _tasksStore.addTask(task);
  }
}