import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:project/components/task_item_widget.dart';
import 'package:project/models/Task.dart';
import 'package:project/stores/tasks_store.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String _title;

  String titleValidator(String? value) {
    if (value!.isEmpty) {
      return 'O campo não pode ficar vazio';
    }

    return null!;
  }

  void sendForm(GlobalKey<FormState> formKey, TasksStore _tasksStore) {
      formKey.currentState!.save();
      
      final uuid = Uuid();
      final Task task = Task(
        id: uuid.v1(),
        title: _title,
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
        padding: EdgeInsets.all(10),
        
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(hintText: "Nova Tarefa"),
                validator: titleValidator,
                onSaved: (value) {
                  _title = value!;
                },
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => sendForm(_formKey, _tasksStore),
        child: Icon(Icons.add),
      ),
    );
  }
}

