import '../../../service_locator.dart';
import '../../repository/task/task.dart';
import '../usecase.dart';

class DeleteTaskUseCase implements UseCase<void,String>{
  @override
  Future<void> call({String? params}) async {
    await sL<TaskRepository>().deleteTask(params!);
  }


}