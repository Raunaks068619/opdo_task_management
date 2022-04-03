import 'package:counter_bloc/constants/appRouter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FnameState extends Equatable {}

class FnameInitial extends FnameState {
  TextEditingController controller = TextEditingController();
  // List<String> tasks = [];
  FnameInitial({
    required this.controller,
    // required this.tasks,
  });
  @override
  List<Object> get props => [
        controller,
        // tasks,
      ];
}

class FnameLoading extends FnameState {
  @override
  List<Object> get props => [];
}

class FnameEmpty extends FnameState {
  String msg;
  FnameEmpty({required this.msg});
  @override
  List<Object> get props => [msg];
}

class AddFnameSuccessful extends FnameState {
  String msg;
  String route;
  AddFnameSuccessful({required this.msg, required this.route});
  @override
  List<Object> get props => [msg, route];
}

class FnameError extends FnameState {
  String msg;
  FnameError({required this.msg});
  @override
  List<Object> get props => [msg];
}
