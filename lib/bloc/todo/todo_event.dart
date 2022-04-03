import 'package:counter_bloc/modal/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TodoEvent extends Equatable {}

class AddTodo extends TodoEvent {
  TextEditingController controller;
  List<TaskModel> task;
  AddTodo({required this.controller, required this.task});
  @override
  List<Object> get props => [controller, task];
}
