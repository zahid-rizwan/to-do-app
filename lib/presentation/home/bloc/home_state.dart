part of 'home_bloc.dart';

 class HomeState extends Equatable{

   final List<TaskModel> today,tomorrow,thisWeek,thisMonth,other,completed,missed;
   final Status status;

  HomeState({
    this.today=const [],
    this.tomorrow=const [],
    this.thisWeek=const [],
    this.thisMonth=const [],
    this.other=const [],
    this.completed=const [],
    this.missed=const[],
    this.status=Status.loading});

  HomeState copyWith({List<TaskModel>? today, List<TaskModel>? tomorrow, List<TaskModel>? thisWeek, List<TaskModel>? thisMonth, List<TaskModel>? other, List<TaskModel>? completed, List<TaskModel>? missed,Status? status}){
    return HomeState(
      today: today?? this.today,
      tomorrow: tomorrow?? this.tomorrow,
      thisWeek: thisWeek?? this.thisWeek,
      thisMonth: thisMonth??this.thisMonth,
      other: other?? this.other,
      completed: completed?? this.completed,
      missed: missed?? this.missed,
      status: status?? this.status
    );
}


  @override
  List<Object?> get props => [today,tomorrow,thisWeek,thisMonth,other,completed,missed,status];

 }


