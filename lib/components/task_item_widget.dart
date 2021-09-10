import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:project/models/Task.dart';
import 'package:project/stores/tasks_store.dart';

class TaskItemWidget extends StatelessWidget {
  final _tasksStore = GetIt.I.get<TasksStore>();
  final Task task;
  
  TaskItemWidget(this.task);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,

        background: Container(
          color: Colors.red,
          padding: EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Icon(Icons.delete, color: Colors.white,),
              SizedBox(width: 5,),
              Text('Apagar', style: TextStyle(color: Colors.white),)
            ],
          ),
        ),

        onDismissed: (direction) {
          _tasksStore.removeTask(task);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 500),
            backgroundColor: Theme.of(context).primaryColor,
            content: Text('${task.title} foi removido da lista.'
            )
          ));
        },

        child: CheckboxListTile(
          title: Text(task.title, style: Theme.of(context).textTheme.headline6),
          activeColor: Theme.of(context).primaryColor,

          onChanged: (bool? value) {
              _tasksStore.changeIsCheck(task, value);
          },

          value: task.isCheck,
        ),
      ),
    );
  }
}
