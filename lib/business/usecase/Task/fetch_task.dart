import 'package:todo/business/repository/task/task.dart';
import 'package:todo/business/usecase/usecase.dart';

import '../../../data/models/task.dart';
import '../../../service_locator.dart';

class FetchTaskUseCase implements UseCase<Stream<List<TaskModel>>? ,dynamic>{
  @override
  Future<Stream<List<TaskModel>>?> call({params}) async {
    return await sL<TaskRepository>().fetchTasks();
  }


}