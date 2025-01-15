import 'package:todo/business/repository/task/task.dart';
import 'package:todo/business/usecase/usecase.dart';
import 'package:todo/data/models/task.dart';

import '../../../service_locator.dart';

class UpdateTaskUseCase implements UseCase<void,TaskModel>{
  @override
  Future<void> call({TaskModel? params}) async {
     await sL<TaskRepository>().updateTask(params!);
  }

}