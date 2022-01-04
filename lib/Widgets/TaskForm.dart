import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget {
  //const TaskForm({Key? key}) : super(key: key);
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTask;

  TaskForm({
    this.title,
    this.description,
    required this.onChangedDescription,
    required this.onChangedTitle,
    required this.onSavedTask,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTitle(),
          SizedBox(
            height: 10,
          ),
          buildDescription(),
          SizedBox(
            height: 32,
          ),
          buildSavedButton()
        ],
      ),
    );
  }

  Widget buildTitle() =>
      TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() =>
      TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildSavedButton() =>
      SizedBox(
        width: double.infinity, height: 40,
        child: ElevatedButton(
          onPressed: onSavedTask,
          child: Text('Save'),
          style:ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
        ),
      );
}
