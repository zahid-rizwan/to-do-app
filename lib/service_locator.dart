
import 'package:get_it/get_it.dart';
import 'package:todo/business/repository/task/task.dart';
import 'package:todo/business/usecase/Task/delete_task.dart';
import 'package:todo/business/usecase/Task/fetch_task.dart';
import 'package:todo/business/usecase/Task/save_task.dart';
import 'package:todo/business/usecase/Task/update_task.dart';
import 'package:todo/data/repository/task/task.dart';
import 'package:todo/data/sources/tasks/tasks_firebase_service.dart';

import 'business/repository/auth/auth.dart';

import 'business/usecase/auth/signin_with_email_password.dart';
import 'business/usecase/auth/signup_with_email_password.dart';
import 'data/repository/auth/auth.dart';
import 'data/sources/auth/auth_firebase_service.dart';

final sL=GetIt.instance;

Future<void> initializeDependencies()async{

  sL.registerSingleton<AuthFirebaseService>(
      AuthFirebaseServiceImpl());

  sL.registerSingleton<AuthRepository>(
      AuthRepositoryImpl());

  sL.registerSingleton<SignupWithEmailPasswordUseCase>(
      SignupWithEmailPasswordUseCase());

  sL.registerSingleton<SigninWithEmailPasswordUseCase>(
      SigninWithEmailPasswordUseCase());
  sL.registerSingleton<TasksFirebaseService>(
      TasksFirebaseServiceImpl());
  sL.registerSingleton<TaskRepository>(
    TaskRepositoryImpl());
  sL.registerSingleton<SaveTaskUseCase>(
    SaveTaskUseCase());
   sL.registerSingleton<FetchTaskUseCase>(
     FetchTaskUseCase());
   sL.registerSingleton<DeleteTaskUseCase>(
     DeleteTaskUseCase());
   sL.registerSingleton<UpdateTaskUseCase>(
     UpdateTaskUseCase());

}