part of 'add_task_bloc.dart';

class AddTaskEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ChangeDate extends AddTaskEvent{
  final DateTime date;
  ChangeDate({required this.date});

  @override
  List<Object?> get props => [date];
}
class ChangeTime extends AddTaskEvent{
  final TimeOfDay time;
  ChangeTime({required this.time});

  @override
  List<Object?> get props => [time];
}
class ChangePriority extends AddTaskEvent{
  final String priority;
  ChangePriority({required this.priority});

  @override
  List<Object?> get props => [priority];
}
class SaveTask extends AddTaskEvent{
  final String title,description;
 final BuildContext context;
  SaveTask({required this.title, required this.description,required this.context});
  @override
  List<Object?> get props => [title,description,context];

}

