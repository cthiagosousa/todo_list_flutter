import 'package:mobx/mobx.dart';
import 'package:project/models/Task.dart';
import 'package:project/database/tasks.dart';

part 'tasks_store.g.dart';

class TasksStore = _TasksStore with _$TasksStore;

abstract class _TasksStore with Store{

  @observable
  List<Task> tasks = data;

  @action
  void addTask(Task task) {
    this.tasks.add(task);
  }
}