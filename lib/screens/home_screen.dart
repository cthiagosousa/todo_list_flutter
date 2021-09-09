import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

import 'package:project/stores/tasks_store.dart';
import 'package:project/models/Task.dart';
import 'package:project/components/task_item_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  String titleValidator(String? value) {
    if (value!.isEmpty) {
      return 'O campo não pode ficar vazio';
    }

    return null!;
  }

  void sendForm(TasksStore _tasksStore) {      
      final uuid = Uuid();
      final Task task = Task(
        id: uuid.v1(),
        title: _titleController.text,
        isCheck: false,
      );

      _tasksStore.addTask(task);
  }

  Widget build(BuildContext context) {
  final _tasksStore = Provider.of<TasksStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Tarefas'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nova Tarefa",
                        border: InputBorder.none
                      ),
                      controller: _titleController,
                      validator: titleValidator,
                    ),
                  ),
                  IconButton(
                    onPressed: () => sendForm(_tasksStore),
                    icon: Icon(Icons.add, color: Colors.white,),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Observer(
                builder: (BuildContext context) => ListView.builder(
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

