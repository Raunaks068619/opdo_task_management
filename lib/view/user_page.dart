import 'package:counter_bloc/bloc/todo/todo_event.dart';
import 'package:counter_bloc/modal/task_model.dart';
import 'package:counter_bloc/services/add_user_data.dart';
import 'package:counter_bloc/services/read_user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/todo/todo_bloc.dart';
import '../bloc/todo/todo_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List tasks = [
    //   "task1",
    //   "task2",
    //   "task3",
    //   "task4",
    //   "task5",
    //   "task6",
    //   "task7",
    //   "task8",
    //   "task9",
    //   "task10"
    // ];
    return Scaffold(
      // body: Text("Hello")
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      // width: MediaQuery.of(context).size.width * 0.8,
                      child: BlocBuilder<TodoBloc, TodoState>(
                        builder: (context, state) {
                          return TextField(
                            controller: state is TodoInitial
                                ? state.controller
                                : TextEditingController(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Task here',
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        // width: MediaQuery.of(context).size.width * 0.2,

                        child: Container(
                          height: 50,
                          color: Colors.blue,
                          child: BlocConsumer<TodoBloc, TodoState>(
                            listener: (context, state) {
                              if (state is AddedNewtask) {
                                Fluttertoast.showToast(
                                    msg: state.msg,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                // Navigator.of(context).pushReplacementNamed(state.route);
                              } else if (state is TodoError) {
                                Fluttertoast.showToast(
                                    msg: state.msg,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (state is TodoEmpty) {
                                Fluttertoast.showToast(
                                    msg: state.msg,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            builder: (context, state) {
                              return TextButton(
                                  onPressed: () {
                                    if (state is TodoInitial) {
                                      context.read<TodoBloc>().add(AddTodo(
                                            controller: state.controller,
                                            task: state.tasks,
                                          ));
                                    }
                                  },
                                  child: Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ));
                            },
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is TodoInitial) {
                      print(state.tasks.map((e) => e.toString()).toList());

                      return ListView.builder(
                        itemCount:
                            state is TodoInitial ? state.tasks.length : 0,
                        itemBuilder: (context, index) {
                          return tasksFun(state.tasks[index]);
                        },
                      );
                    } else {
                      return Center(
                        child: Text("Add a New Task"),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoLoading) {
                print("Didnt work broooo (indicator)");
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator()),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  ListTile tasksFun(TaskModel task) {
    return ListTile(
      title: Text(task.title),
      trailing: GestureDetector(
          onTap: () {}, child: Icon(Icons.check_circle_outline)),
    );
  }
}
