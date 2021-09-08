import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:project/models/Task.dart';
import 'package:project/stores/tasks_store.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _tasksStore = TasksStore();
  late String _title;

  String _titleValidator(String? value) {
    if (value!.isEmpty) {
      return 'O campo não pode ficar vazio';
    }

    return null!;
  }

  void _sendForm() {
      _formKey.currentState!.save();
      
      final uuid = Uuid();
      final Task task = Task(
        id: uuid.v1(),
        title: _title,
        isCheck: false,
      );

      _tasksStore.addTask(task);
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cria uma nova tarefa'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Nome da Tarefa"),
                maxLength: 40,
                validator: _titleValidator,
                onSaved: (String? value) {
                  _title = value!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                    ),
                    onPressed: _sendForm,
                    child: Text("Criar", style: Theme.of(context).textTheme.button,)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}