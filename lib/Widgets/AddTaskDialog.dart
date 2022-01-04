import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/TaskModel.dart';
import '../Widgets/TaskForm.dart';
import '../Provider/TasksProvider.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey, // is to validate title
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      'New Task',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              // Todo
              TaskForm(
                onChangedTitle: (titleEntered) =>
                    setState(() => this.title = titleEntered),
                onChangedDescription: (descriptionEntered) =>
                    setState(() => this.description = descriptionEntered),
                onSavedTask: addTaskHandler,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTaskHandler() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final task = TaskModel(
        id: Random().nextInt(5000).toString(),
        createdTime: DateTime.now(),
        title: title,
        description: description,
      );
      // Todo implement Firebase
      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.addTask(task);
      // provider.firestoreAddTask(task);

      Navigator.of(context).pop();
    }
  }
}
