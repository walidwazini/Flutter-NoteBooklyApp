import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/TaskForm.dart';
import '../Provider/TasksProvider.dart';
import '../Models/TaskModel.dart';

class EditTaskScreen extends StatefulWidget {
  // const EditTaskScreen({Key? key}) : super(key: key);
  final TaskModel taskToEdit;

  EditTaskScreen({required this.taskToEdit});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;

  @override
  void initState() {
    // TODO: implement initState
    // to get initial value of each title and desc
    super.initState();

    title = widget.taskToEdit.title;
    description = widget.taskToEdit.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1e00b7),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TaskForm(
            title: title,
            description: description,
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onChangedTitle: (title) => setState(() => this.title = title),
            onSavedTask: updateTaskHandler,
          ),
        ),
      ),
    );
  }

  void updateTaskHandler() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.updateTask(widget.taskToEdit, title!, description!);

      Navigator.of(context).pop();
    }
  }
}
