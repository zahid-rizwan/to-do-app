
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/business/usecase/Task/delete_task.dart';
import 'package:todo/business/usecase/Task/fetch_task.dart';

import 'package:todo/data/models/task.dart';
import 'package:todo/service_locator.dart';

import '../../../business/usecase/Task/update_task.dart';
import '../../../core/configs/constants/status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final List<TaskModel> today = [];
  final List<TaskModel> tomorrow = [];
  final List<TaskModel> thisWeek = [];
  final List<TaskModel> thisMonth = [];
  final List<TaskModel> other = [];
  HomeBloc() : super(HomeState()) {
  on<FetchTasks>(_fetchTasks);
  on<SelectAndUnselectTask>(_selectAndUnselectTask);
  on<DeleteTask>(_deleteTask);
  }

  Future<void> _fetchTasks(FetchTasks event, Emitter<HomeState> emit) async {
    final fetchTaskUseCase = sL<FetchTaskUseCase>();
    final stream = await fetchTaskUseCase.call();

    if (stream == null) {
      emit(state.copyWith(status: Status.error));
      return;
    }

    try {
     await for (final data in stream) {
        final now = DateTime.now();

        final List<TaskModel> today = [];
        final List<TaskModel> tomorrow = [];
        final List<TaskModel> thisWeek = [];
        final List<TaskModel> thisMonth = [];
        final List<TaskModel> other = [];
        final List<TaskModel> missed = [];
        final List<TaskModel> completed = [];


        for (var item in data) {
          final itemDateTime = _parseDateTime(item.date, item.time);
          if (itemDateTime != null) {
            if (item.isDone) {
              completed.add(item); // Add to completed if isDone is true
            } else if (itemDateTime.isBefore(now)) {
              missed.add(item); // Add to missed if time has already passed
            } else if (_isToday(now, itemDateTime)) {
              today.add(item);
            } else if (_isTomorrow(now, itemDateTime)) {
              tomorrow.add(item);
            } else if (_isThisWeek(now, itemDateTime)) {
              thisWeek.add(item);
            } else if (_isThisMonth(now, itemDateTime)) {
              thisMonth.add(item);
            } else {
              other.add(item);
            }
          }
        }

        emit(state.copyWith(
          today: today,
          tomorrow: tomorrow,
          thisWeek: thisWeek,
          thisMonth: thisMonth,
          other: other,
          completed: completed,
          missed: missed,
          status: Status.sucess,
        ));
      }
    } catch (error) {

      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> _selectAndUnselectTask(SelectAndUnselectTask event,Emitter<HomeState> emit) async {
    TaskModel task=TaskModel(
        id: event.taskModel.id,
        title: event.taskModel.title,
        description: event.taskModel.description,
        date: event.taskModel.date,
        time: event.taskModel.time,
        priority: event.taskModel.priority,
        isDone: !event.taskModel.isDone);
    await sL<UpdateTaskUseCase>().call(params: task);
  }
  Future<void> _deleteTask(DeleteTask event,Emitter<HomeState> emit) async {

    await sL<DeleteTaskUseCase>().call(params: event.id);
  }


  DateTime? _parseDateTime(String date, String time) {
    try {
      final dateParts = date.split('/');
      final timeParts = time.split(' ');
      final hourMinute = timeParts[0].split(':');
      final isPM = timeParts[1] == 'PM';
      final hour = int.parse(hourMinute[0]) + (isPM && hourMinute[0] != '12' ? 12 : 0);
      final minute = int.parse(hourMinute[1]);

      return DateTime(
        int.parse(dateParts[2]),
        int.parse(dateParts[1]),
        int.parse(dateParts[0]),
        hour,
        minute,
      );
    } catch (e) {
      debugPrint('Error parsing date/time: $e');
      return null;
    }
  }

  bool _isToday(DateTime now, DateTime date) => now.day == date.day && now.month == date.month && now.year == date.year;
  bool _isTomorrow(DateTime now, DateTime date) => now.add(const Duration(days: 1)).day == date.day && now.month == date.month && now.year == date.year;
  bool _isThisWeek(DateTime now, DateTime date) => now.weekday <= date.weekday && now.isBefore(date) && now.add(Duration(days: 7)).isAfter(date);
  bool _isThisMonth(DateTime now, DateTime date) => now.month == date.month && now.year == date.year;
}
