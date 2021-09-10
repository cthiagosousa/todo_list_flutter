import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:project/stores/tasks_store.dart';
import 'package:project/components/task_item_widget.dart';
import 'package:project/components/costom_input_widget.dart';

class HomeScreen extends StatelessWidget {
  final _tasksStore = GetIt.I.get<TasksStore>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Tarefas'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        
        child: Column(
          children: [
            CustomInputWidget(),

            SizedBox(height: 10,),
            
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                itemCount: _tasksStore.tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasksStore.tasks[index];
                  return TaskItemWidget(task);
                }
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

