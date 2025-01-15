part of 'home_bloc.dart';

class HomeEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class FetchTasks extends HomeEvent{}
class SelectAndUnselectTask extends HomeEvent{
  final TaskModel taskModel;
  SelectAndUnselectTask({required this.taskModel});
  @override
  List<Object?> get props => [taskModel];
}
class DeleteTask extends HomeEvent{
  final String id;
  DeleteTask({required this.id});
  @override
  List<Object?> get props => [id];
}
