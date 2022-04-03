import 'package:counter_bloc/bloc/addtask/addtask_event.dart';
import 'package:counter_bloc/bloc/addtask/addtask_state.dart';
import 'package:counter_bloc/services/add_user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/read_user_data.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc()
      : super(AddTaskInitial(titleController: TextEditingController(), descriptionController: TextEditingController(), date: DateTime.now())){
    on<UploadTaskClicked>((event, emit) async {
      //Add AddTask function
      await addNewTask(event, emit);
      //rEAD AddTask function
      // await readAddTaskTasks(event, emit);
    });
  }
}
