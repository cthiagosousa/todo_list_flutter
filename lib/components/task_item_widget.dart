import 'package:flutter/material.dart';
import 'package:project/models/Task.dart';
import 'package:project/stores/tasks_store.dart';

class TaskItemWidget extends StatefulWidget {
  final Task task;

  const TaskItemWidget(this.task);

  @override
  _TaskItemWidget createState() => _TaskItemWidget();
}

class _TaskItemWidget extends State<TaskItemWidget> {
  final _tasksStore = TasksStore();
  
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
          _tasksStore.removeTask(widget.task);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 500),
            backgroundColor: Theme.of(context).primaryColor,
            content: Text('${widget.task.title} foi removido da lista.'
            )
          ));
        },

        child: CheckboxListTile(
          title: Text(widget.task.title, style: Theme.of(context).textTheme.headline6),
          activeColor: Theme.of(context).primaryColor,
          onChanged: (bool? value) {
              setState(() => widget.task.changeIsCheck(value!));
          },
          value: widget.task.isCheck,
        ),
      ),
    );
  }
}
