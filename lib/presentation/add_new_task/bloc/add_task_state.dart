part of 'add_task_bloc.dart';

class AddTaskState extends Equatable{
   DateTime?  date;
   TimeOfDay? time;
  final String priority;
  final Status status;

  AddTaskState({
    this.status=Status.initial,
    this.date,
    this.time,
    this.priority=Priority.low});
  AddTaskState copyWith({DateTime?  date,TimeOfDay? time, String? priority, Status? status}){
    return AddTaskState(
      date: date?? this.date,
      time: time?? this.time,
      priority: priority?? this.priority,
      status: status?? this.status
    );
  }

  @override
  List<Object?> get props => [date,time,priority,status];

}
