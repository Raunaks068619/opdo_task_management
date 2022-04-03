import 'package:counter_bloc/bloc/todo/todo_event.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';
import 'package:counter_bloc/services/add_user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/read_user_data.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(TodoInitial(controller: TextEditingController(), tasks: [])) {
    // on<AddTodo>((event, emit) async {
    //   //Add Todo function
    //   await addNewTask(event, emit);
    //   //rEAD Todo function
    //   // await readTodoTasks(event, emit);
    // });
  }
}
