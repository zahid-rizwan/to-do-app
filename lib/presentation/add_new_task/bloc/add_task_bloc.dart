
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:todo/business/usecase/Task/save_task.dart';
import 'package:todo/business/usecase/Task/update_task.dart';
import 'package:todo/core/configs/constants/priority.dart';
import 'package:todo/data/models/task.dart';
import 'package:todo/service_locator.dart';

import '../../../core/configs/constants/status.dart';


part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super (AddTaskState()){
    on<ChangeDate>(_changeDate);
    on<ChangeTime>(_changeTime);
    on<ChangePriority>(_changePriority);
    on<SaveTask>(_saveTask);

  }
  void _changeDate(ChangeDate event,Emitter<AddTaskState> emit){
    emit(state.copyWith(date: event.date));
  }
  void _changeTime(ChangeTime event,Emitter<AddTaskState> emit){
    emit(state.copyWith(time: event.time));
  }
  void _changePriority(ChangePriority event, Emitter<AddTaskState> emit){
    emit(state.copyWith(priority: event.priority));
  }

  void _saveTask(SaveTask event, Emitter<AddTaskState> emit)async{
    emit(state.copyWith(status: Status.loading));
    String id=randomAlphaNumeric(10);
    var date=state.date?? DateTime.now();
    var time=state.time?? TimeOfDay.now();
    TaskModel task=TaskModel(
        id: id,
        title: event.title,
        description: event.description,
        date: "${date.day}/${date.month}/${date.year}",
        time: time.format(event.context).toString(),
        priority: state.priority,
        isDone: false);

    var result= await sL<SaveTaskUseCase>().call(
      params: task);
    result.fold(
            (l){
              print(l);
          ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(content: Text(l),
                backgroundColor: Colors.red,));
          emit(state.copyWith(status: Status.error));
        },
            (r){
      ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(content: Text(r),
            backgroundColor: Colors.green,));
      emit(state.copyWith(status: Status.sucess));
    });
  }



}

