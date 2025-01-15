import 'package:dartz/dartz.dart';
import 'package:todo/business/repository/task/task.dart';
import 'package:todo/business/usecase/usecase.dart';

import 'package:todo/service_locator.dart';

import '../../../data/models/task.dart';

class SaveTaskUseCase implements UseCase<Either,TaskModel>{
  @override
  Future<Either> call({TaskModel? params}) async{
    return await sL<TaskRepository>().AddTask(params!);
  }

}