import 'package:counter_bloc/modal/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeEvent extends Equatable {}

class AddButtonCLick extends HomeEvent {
  List<TaskModel> task;
  AddButtonCLick({ required this.task});
  @override
  List<Object> get props => [task];
}

class LoadinTask extends HomeEvent {
  @override
  List<Object> get props => [];
}