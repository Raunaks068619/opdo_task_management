import 'package:counter_bloc/bloc/home/home_event.dart';
import 'package:counter_bloc/constants/navbar.dart';
import 'package:counter_bloc/modal/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_state.dart';
import '../bloc/todo/todo_bloc.dart';
import '../bloc/todo/todo_state.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // List cards = [
    //   card(width, height),
    // ];
    return Scaffold(
      appBar: NavBar(width, user),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadUserDataInit) {
            context.read<HomeBloc>().add(LoadinTask());
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            // color: Colors.amber,
            width: width,
            height: height,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return AlignedGridView.count(
                  padding: EdgeInsets.symmetric(
                    vertical: width > 600 ? 40 : 20,
                    horizontal: width > 1250
                        ? 80
                        : width > 800
                            ? 85
                            : width > 600
                                ? 90
                                : 40,
                  ),
                  crossAxisCount: width > 1250
                      ? 4
                      : width > 900
                          ? 3
                          : width > 600
                              ? 2
                              : 1,
                  mainAxisSpacing: width > 1250
                      ? 50
                      : width > 900
                          ? 40
                          : width > 600
                              ? 30
                              : 20,
                  crossAxisSpacing: width > 1250
                      ? 50
                      : width > 900
                          ? 40
                          : width > 600
                              ? 30
                              : 20,
                  itemCount: state is HomeInitial ? state.tasks.length : 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (state is HomeInitial) {
                      return card(width, height, state.tasks[index]);
                    }
                  },
                  // children: List.from(List.generate(4, (index) {
                  //   return card(width, height);
                  // })),
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        width: 70,
        height: 70,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 73, 133, 245),
              onPressed: () {
                if (state is HomeInitial) {
                  print(state);

                  Navigator.pushNamed(context, '/addtask_page',
                      arguments: user);
                }
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
            );
          },
        ),
      ),
    );
  }

  Container card(double width, double height, TaskModel task) {
    return Container(
        // width: 260,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(10, 0, 0, 0),
              offset: Offset(4, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              // width: 250,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              // color: Colors.amber,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: width * 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              // task.title == ""
                              // ?
                              "${task.title}"
                              // : "Example task",
                              ,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  color: Color(0xFF464646),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23)),
                          SizedBox(height: 5),
                          Text(
                            "description...",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0xFF969696),
                            ),
                          ),
                          Text(
                            ". . .",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0xFF969696),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // width: 250,
                    child: Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("no deus",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFC8C8C8),
                                )),
                            Icon(
                              Icons.check_circle_outline,
                              color: Color(0xFFD1D1D1),
                              // Icon(Icons.check_circle_rounded,color: Color(0xFF4964F5),   // Icon and IconColor change after (isDone==true)
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Container(
              width: 5,
              height: height,
              margin: EdgeInsets.symmetric(vertical: 40),
              color: Color.fromARGB(255, 85, 231, 158),
            ),
          ],
        ));
  }
}
