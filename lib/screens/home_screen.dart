import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/controllers/home_controller.dart';

import 'package:project/components/task_item_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _controller = HomeController();

  Widget build(BuildContext context) {
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
                decoration: InputDecoration(hintText: "Tarefa"),
                validator: _controller.titleValidator,
                onSaved: (value) {
                  _controller.titleInputValue = value!;
                },
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Observer(
                builder: (BuildContext context) => ListView.builder(
                itemCount: _controller.tasks.length,
                itemBuilder: (context, index) {
                  final task = _controller.tasks[index];
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
        onPressed: () => _controller.sendForm(_formKey),
        child: Icon(Icons.add),
      ),
    );
  }
}

