import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/addtask/addtask_bloc.dart';
import '../bloc/addtask/addtask_event.dart';
import '../bloc/addtask/addtask_state.dart';

class AddTaskPage extends StatelessWidget {
  final User user;
  const AddTaskPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AddTaskBloc, AddTaskState>(
          builder: (context, state) {
            print("********${state.toString()}********");
            if (state is AddTaskSuccess) {
              Fluttertoast.showToast(msg: state.msg);
              Navigator.of(context).pushNamed(state.route, arguments: user);
            }
            if (state is AddTaskInitial) {
              return Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Task title here',
                    ),
                    controller: state is AddTaskInitial
                        ? state.titleController
                        : TextEditingController(),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Task Description here',
                    ),
                    controller: state is AddTaskInitial
                        ? state.descriptionController
                        : TextEditingController(),
                  ),
                  Text(user.displayName as String)
                  // DatePickerDialog(
                  //     helpText: "Select Date",
                  //     initialDate: DateTime(1969, 1, 1),
                  //     firstDate: DateTime.now(),
                  //     lastDate: DateTime(2030, 1, 1)),
                  // TextButton(
                  //   onPressed: () {
                  //     showDatePicker(
                  //         context: context,
                  //         initialDate: DateTime(1969, 1, 1),
                  //         firstDate: DateTime.now(),
                  //         lastDate: DateTime(2030, 1, 1));
                  //   },
                  //   child: Text('select Date'),
                  // ),
                ],
              );
            }
            return Text('AddTaskPage');
          },
        ),
      ),
      floatingActionButton: BlocBuilder<AddTaskBloc, AddTaskState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              if (state is AddTaskInitial) {
                context.read<AddTaskBloc>().add(UploadTaskClicked(
                    date: DateTime.now(),
                    descriptionController: state.descriptionController,
                    titleController: state.titleController));
              }
            },
            child: Icon(Icons.send),
          );
        },
      ),
    );
  }
}
