import 'package:dartz/dartz.dart';
import 'package:todo/data/models/task.dart';

abstract class TaskRepository{
  Future<Either> AddTask(TaskModel task);
  Future<Stream<List<TaskModel>>?>  fetchTasks();
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String taskId);
}