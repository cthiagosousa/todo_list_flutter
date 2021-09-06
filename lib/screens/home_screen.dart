import 'package:flutter/material.dart';
import 'package:project/models/Task.dart';
import 'package:project/database/tasks.dart';
import 'package:project/components/task_item_widget.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = data;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Tarefas'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final Task item = tasks[index];
            return TaskItemWidget(title: item.title);
          }
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

