import 'package:flutter/material.dart';

import '../../core/configs/constants/priority.dart';

class TaskModel{
  final String id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String priority;
  final bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    required this.isDone }
  );

  factory TaskModel.fromJson(Map<String, dynamic> json){
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date:json['date'],
        time: json['time'],
        priority: json['priority'],
       isDone: json['isDone']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'description':description,
      'date':date,
      'time':time,
      'priority':priority,
      'isDone':isDone

    };
  }
}