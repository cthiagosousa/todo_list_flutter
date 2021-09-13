import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import 'package:project/models/Task.dart';
import 'package:project/stores/tasks_store.dart';

class CustomInputWidget extends StatelessWidget {
  final TasksStore _tasksStore = GetIt.I.get<TasksStore>();
  final TextEditingController _titleController = TextEditingController();

  bool _titleValidate(BuildContext context) {
    if(_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text('O campo não pode estar vazio')
          )
      );

      return false;
    }

    return true;
  }

  void _sendForm(BuildContext context) {
    if(_titleValidate(context)) {
        final uuid = Uuid();
        final Task task = Task(
          id: uuid.v1(),
          title: _titleController.text,
          isCheck: false,
        );

        _tasksStore.addTask(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )
      ),
      child: Row(
        children: [
          Expanded(
            child: Form(
              child: TextFormField(
                style: Theme.of(context).textTheme.headline3,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.headline3,
                  hintText: "Nova Tarefa",
                  border: InputBorder.none
                  ),
                controller: _titleController,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _sendForm(context);
              _titleController.clear();
              FocusScope.of(context).unfocus();
            },
            icon: Icon(Icons.add, color: Colors.white,),
          )
        ],
      ),
    );
  }
}