import 'package:counter_bloc/bloc/login/login_state.dart';
import 'package:counter_bloc/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../../services/read_user_data.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(GoogleLoginInitial(defaultColor: Colors.black)) {
    on<GoogleLoginPressed>(
      (event, emit) async {
        print("LoginPressed");
        await signInWithGoogle(event, emit);
      },
    );
    on<OnHover>(
      (event, emit) {
        print("OnHover");
        emit(GoogleLoginInitial(defaultColor: Colors.blue));
      },
    );

    on<OnExit>(
      (event, emit) {
        print("OnExit");
        emit(GoogleLoginInitial(defaultColor: Colors.black));
      },
    );
  }
}
