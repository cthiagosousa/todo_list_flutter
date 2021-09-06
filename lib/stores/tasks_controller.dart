import 'package:mobx/mobx.dart';
import 'package:project/models/Task.dart';
import 'package:project/database/tasks.dart';

abstract class TasksStore with Store{

  @observable
  final List<Task> _tasks = data;

  @action
  void addTask(Task task) {
    this._tasks.add(task);
  }
}