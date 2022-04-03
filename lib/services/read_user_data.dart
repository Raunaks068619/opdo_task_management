import 'package:bloc/src/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_bloc/bloc/home/home_event.dart';
import 'package:counter_bloc/bloc/todo/todo_event.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';
import 'package:counter_bloc/modal/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../bloc/home/home_state.dart';

Future<void> readTodoTasks(AddButtonCLick event, Emitter<HomeState> emit) async {
  try {
    List<TaskModel> tasks = []; // have to put task[1] in tasks

    emit(HomeLoading());
    final User? user = FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection("user")
        .doc(user?.uid)
        .collection('tasks')
        .get();

    if (data.docs.isNotEmpty) {
      data.docs.forEach((element) {
        TaskModel task = TaskModel(
            title: element['title'],
            description: element['description'],
            isDone: element['isDone'],
            urgency: element['urgency'],
            date: element['date']);

        tasks.add(task);
      });
      // task = data.docs.map((doc) {doc.get('task');});
    }
    print(data.docs);
    emit(HomeInitial(tasks: tasks));
  } on Exception catch (e) {
    // Home
    emit(HomeError(msg: "Pleas add some tasks"));
  }
}
