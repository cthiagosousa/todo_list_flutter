import 'package:flutter/material.dart';

class TaskItemWidget extends StatefulWidget {
  final String title;

  const TaskItemWidget({required this.title});

  @override
  _TaskItemWidget createState() => _TaskItemWidget();
}

class _TaskItemWidget extends State<TaskItemWidget> {
  bool _checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        title: Text(widget.title, style: Theme.of(context).textTheme.headline6),

        onChanged: (bool? value) {
            setState(() => _checkValue = value!);
        },
        value: _checkValue,
      ),
    );
  }
}
