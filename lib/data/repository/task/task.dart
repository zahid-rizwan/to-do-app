import 'package:dartz/dartz.dart';
import 'package:todo/business/repository/task/task.dart';
import 'package:todo/data/models/task.dart';
import 'package:todo/data/sources/tasks/tasks_firebase_service.dart';

import '../../../service_locator.dart';

class TaskRepositoryImpl extends TaskRepository{
  @override
  Future<Either> AddTask(TaskModel task) async{
    return await sL<TasksFirebaseService>().UploadTask(task);
  }

  @override
  Future<Stream<List<TaskModel>>?> fetchTasks() async{
    return await sL<TasksFirebaseService>().fetchTasks();
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await sL<TasksFirebaseService>().deleteTask(taskId);
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    await sL<TasksFirebaseService>().updateTask(task);
  }

}