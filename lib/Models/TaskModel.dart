class TaskField {
  static const createdTime = 'createdTime';
}

class TaskModel {
  String id;
  DateTime? createdTime;
  String title;
  String description;
  bool isDone;

  TaskModel({
    required this.id,
    required this.createdTime,
    required this.title,
    this.description = '',
    this.isDone = false,
  });
}
