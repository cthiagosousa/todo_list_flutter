import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import 'package:project/models/Task.dart';
import 'package:project/stores/tasks_store.dart';

class CustomInputWidget extends StatelessWidget {
  final _tasksStore = GetIt.I.get<TasksStore>();
  final _titleController = TextEditingController();

  String titleValidator(String? value) {
    if (value!.isEmpty) {
      return 'O campo não pode ficar vazio';
    }

    return null!;
  }

  void sendForm() {      
      final uuid = Uuid();
      final Task task = Task(
        id: uuid.v1(),
        title: _titleController.text,
        isCheck: false,
      );

      _tasksStore.addTask(task);
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
            child: TextFormField(
              style: Theme.of(context).textTheme.headline3,
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.headline3,
                hintText: "Nova Tarefa",
                border: InputBorder.none
                ),
              controller: _titleController,
              validator: titleValidator,
            ),
          ),
          IconButton(
            onPressed: sendForm,
            icon: Icon(Icons.add, color: Colors.white,),
          )
        ],
      ),
    );
  }
}