import 'package:counter_bloc/modal/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  List<TaskModel> tasks = [];
  HomeInitial({
    required this.tasks,
  });
  @override
  List<Object> get props => [
        tasks,
      ];
}

class LoadUserDataInit extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeError extends HomeState {
  String msg;
  HomeError({required this.msg});
  @override
  List<Object> get props => [msg];
}
