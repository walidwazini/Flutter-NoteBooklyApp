import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:notebookly_app/Models/TaskModel.dart';
import '../Provider/TasksProvider.dart';
import '../Utils.dart';
import '../Screens/EditTaskScreen.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;

  TaskWidget({Key? key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Slidable(
        key: Key(task.id),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: (_) {
                // Todo edit task
                editTaskHandler(context, task);
              },
              backgroundColor: Color(0xFF38E248),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => deleteTaskHandler(context, task),
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
        ),
        child: _buildTask(context),
      ),
    );
  }

  Widget _buildTask(BuildContext ctx) {
    return GestureDetector(
      onLongPress: (){
        print(task.id);
        // Todo jump to view details page, include date in teh page
      },
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(ctx).primaryColor,
              checkColor: Colors.white,
              value: task.isDone,
              onChanged: (_) {
                // Todo : indicate the task is done or not with Provider
                final provider =
                    Provider.of<TasksProvider>(ctx, listen: false);
                 final isDone = provider.toggleTaskStatus(task);

                Utils.showSnackBar(ctx,
                  isDone! ? 'One task completed.' : 'Task marked as incomplete',
                  isDone ? Colors.green : Colors.black26,
                );
              },
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(ctx).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    if (task.description.isNotEmpty)
                      Container(
                        child: Text(
                          task.description,
                          style: TextStyle(fontSize: 18, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void deleteTaskHandler(BuildContext ctx, TaskModel task) {
    final provider = Provider.of<TasksProvider>(ctx, listen: false);
    provider.removeTask(task);
    Utils.showSnackBar(ctx, 'One task DELETED', Colors.red);
  }

  void editTaskHandler(BuildContext ctx, TaskModel task) => Navigator.of(ctx).push(
      MaterialPageRoute(builder: (ctx) => EditTaskScreen(taskToEdit: task,))
  );
}
