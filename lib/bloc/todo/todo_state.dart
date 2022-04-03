import 'package:counter_bloc/modal/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  TextEditingController controller = TextEditingController();
  List<TaskModel> tasks = [];
  TodoInitial({
    required this.controller,
    required this.tasks,
  });
  @override
  List<Object> get props => [
        controller,
        tasks,
      ];
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoEmpty extends TodoState {
  String msg;
  TodoEmpty({required this.msg});
  @override
  List<Object> get props => [msg];
}

class AddedNewtask extends TodoState {
  String msg;
  AddedNewtask({required this.msg});
  @override
  List<Object> get props => [msg];
}

class TodoError extends TodoState {
  String msg;
  TodoError({required this.msg});
  @override
  List<Object> get props => [msg];
}
