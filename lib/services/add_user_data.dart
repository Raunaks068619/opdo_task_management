import 'package:bloc/src/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_bloc/bloc/addtask/addtask_state.dart';
import 'package:counter_bloc/bloc/fname/fname_event.dart';
import 'package:counter_bloc/bloc/fname/fname_state.dart';
import 'package:counter_bloc/bloc/todo/todo_event.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../bloc/addtask/addtask_event.dart';
import '../modal/task_model.dart';

Future<void> addNewTask(
    UploadTaskClicked event, Emitter<AddTaskState> emit) async {
  String title = event.titleController.text;
  String description = event.descriptionController.text;
  DateTime date = event.date;
  // List<TaskModel> tasks = event.tasks;

  try {
    if (title != "") {
      final User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .collection('tasks')
          .doc(title)
          .set({
        'title': title,
        'description': description,
        'date': DateTime.now(),
        'isDone': false,
        'urgency': 0,
        // 'description': _taskDescriptionController.text,
        // 'date': _dateController.text,
        // 'time': _timeController.text,
      });

      emit(AddTaskSuccess(msg: "Added Successfully", route: '/home_page'));
      // emit(AddTaskInitial(
      //     titleController: TextEditingController(),
      //     descriptionController: TextEditingController(),
      //     date: DateTime.now()));
    } else {
      emit(AddTaskEmpty(msg: "Please enter a new task to add a new task"));
    }
  } on Exception catch (e) {
    // AddTask
    print(e);
    emit(AddTaskError(msg: "Something went wrong"));
  }
}

// Add New Fname

Future<void> addFname(AddFNamePressed event, Emitter<FnameState> emit) async {
  String fname = event.controller.text;

  try {
    if (fname != "") {
      final User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('user').doc(user!.uid).set({
        'fname': fname,
      });

      emit(AddFnameSuccessful(
          msg: "Name Added Successfully", route: "/home_page"));
    } else {
      emit(FnameEmpty(msg: "Please enter First Name"));
    }
  } on Exception catch (e) {
    print(e);
    emit(FnameError(msg: "Something went wrong"));
  }
}
