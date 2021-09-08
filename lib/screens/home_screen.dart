import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:project/models/Task.dart';
import 'package:project/stores/tasks_store.dart';
import 'package:project/utils/routes.dart';

import 'package:project/components/task_item_widget.dart';

class HomeScreen extends StatelessWidget {
  final _tasksStore = TasksStore();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Tarefas'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Observer(
          builder: (BuildContext context) => ListView.builder(
          itemCount: _tasksStore.tasks.length,
          itemBuilder: (context, index) {
            final Task item = _tasksStore.tasks[index];
            return TaskItemWidget(title: item.title);
          }
        ),
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.CREATE_TASK);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

