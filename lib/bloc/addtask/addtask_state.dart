import 'package:counter_bloc/modal/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AddTaskState extends Equatable {}

class AddTaskInitial extends AddTaskState {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime date;
  AddTaskInitial({
    required this.titleController,
    required this.descriptionController,
    required this.date,
  });
  @override
  List<Object> get props => [
        titleController,
        descriptionController,
        date,
      ];
}

class AddTaskLoading extends AddTaskState {
  @override
  List<Object> get props => [];
}

class AddTaskEmpty extends AddTaskState {
  String msg;
  AddTaskEmpty({required this.msg});
  @override
  List<Object> get props => [msg];
}

class AddTaskSuccess extends AddTaskState {
  String msg;
  String route;
  AddTaskSuccess({required this.msg, required this.route});
  @override
  List<Object> get props => [msg, route];
}

class AddTaskError extends AddTaskState {
  String msg;
  AddTaskError({required this.msg});
  @override
  List<Object> get props => [msg];
}
