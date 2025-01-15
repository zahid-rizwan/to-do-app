import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/data/models/task.dart';
import 'package:todo/data/sources/user_prefrence/user_prefrence.dart';

abstract class TasksFirebaseService {
  Future<Either> UploadTask(TaskModel task);
  Future<Stream<List<TaskModel>>?>  fetchTasks();
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String taskId);


}

class TasksFirebaseServiceImpl extends TasksFirebaseService{
  @override
  Future<Either> UploadTask(TaskModel task) async {
    String? email=await UserPrefrences().getUser();
    try{
      await FirebaseFirestore.instance.
      collection("Users").
      doc(email).
      collection("Tasks").
      doc(task.id).
      set(task.toJson());
      return const Right('Task Added Successfully');
    }
    catch(e){
      return Left('Something went wrong\n $e');
      }
    }

  @override
  Future<Stream<List<TaskModel>>?> fetchTasks() async {
    String? email = await UserPrefrences().getUser();
    try {
      return FirebaseFirestore.instance.collection('Users')
          .doc(email)
          .collection('Tasks')
          .snapshots().map(
            (snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return TaskModel.fromJson(data);
          }).toList();
        },
      );
    }catch(e){
      return null;
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    String? email = await UserPrefrences().getUser();
   try{
     await FirebaseFirestore.instance
         .collection("Users")
         .doc(email)
         .collection("Tasks")
         .doc(taskId)
         .delete();
   }catch(e){

   }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    String? email = await UserPrefrences().getUser();
    try{
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(email)
          .collection("Tasks")
          .doc(task.id)
          .update(task.toJson());
    }catch (e){

    }
  }


  }

