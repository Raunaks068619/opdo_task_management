import 'package:counter_bloc/bloc/fname/fname_bloc.dart';
import 'package:counter_bloc/bloc/fname/fname_state.dart';
import 'package:counter_bloc/constants/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/fname/fname_event.dart';

class FnamePage extends StatelessWidget {
  final User user;
  FnamePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:NavBar(width,user),

      floatingActionButton: BlocConsumer<FnameBloc, FnameState>(
        listener: (context, state) {
          if (state is AddFnameSuccessful) {
            Fluttertoast.showToast(
                msg: state.msg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushReplacementNamed(context, state.route,arguments: user);///////important
          } else if (state is FnameEmpty) {
            Fluttertoast.showToast(
                msg: state.msg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is FnameError) {
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
          return Container(
            margin: EdgeInsets.fromLTRB(0, 0, 80, 30),
            width: 70,
            height: 70,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF4964F5),
              onPressed: () {
                if (state is FnameInitial) {
                  context
                      .read<FnameBloc>()
                      .add(AddFNamePressed(controller: state.controller));
                }
              },
              child: Icon(
                Icons.send,
                size: 30,
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(width > 600 ? width * 0.15 : 20,
            width > 600 ? height * 0.2 : 20, 0, 0),
        child: BlocBuilder<FnameBloc, FnameState>(
          builder: (context, state) {
            return TextField(
              controller: state is FnameInitial
                  ? state.controller
                  : TextEditingController(),
              style: TextStyle(fontSize: width > 600 ? 60 : 20),
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your first name',
                  hintStyle: TextStyle(color: Color(0xFFABABAB))),
            );
          },
        ),
      ),
    );
  }
}
