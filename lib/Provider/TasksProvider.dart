import 'package:flutter/material.dart';
import 'package:notebookly_app/Models/TaskModel.dart';

class TasksProvider extends ChangeNotifier {
  List<TaskModel> _tasks = [
    TaskModel(
      id: 'e1',
      description: 'Example 1',
      createdTime: DateTime.now(),
      title: 'Title 1',
    ),
    TaskModel(
      id: 'e2',
      description: 'Example 2',
      createdTime: DateTime.now(),
      title: 'Title 2',
    ),
    TaskModel(
      id: 'e3',
      description: 'Example 3',
      createdTime: DateTime.now(),
      title: 'Title 3',
    )
  ];

  // Todo: To set _tasks as public, we create a getter
  // Make sure only task.isNotDone only display
  List<TaskModel> get tasksGetter =>
      _tasks.where((task) => task.isDone == false).toList();
  List<TaskModel> get completedGetter =>
      _tasks.where((taskGiven) => (taskGiven.isDone == true)).toList();

  void addTask(TaskModel newTask){
    _tasks.add(newTask);
    notifyListeners();
  }

  void removeTask(TaskModel selectedTask) {
    _tasks.remove(selectedTask);
    notifyListeners();
  }

  bool? toggleTaskStatus(TaskModel selectedTask) {
    selectedTask.isDone = !selectedTask.isDone;
    notifyListeners();

    return selectedTask.isDone;
  }

  void updateTask(TaskModel taskEdit, String newTitle, String newDescription) {
    taskEdit.title = newTitle;
    taskEdit.description = newDescription;
    notifyListeners();
  }

}
