import 'package:counter_bloc/bloc/home/home_event.dart';
import 'package:counter_bloc/bloc/home/home_state.dart';
import 'package:counter_bloc/services/add_user_data.dart';
import 'package:counter_bloc/services/load_userData_init.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/read_user_data.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadUserDataInit()) {

    on<LoadinTask>((event, emit) async {
      await loadUserDataInit(event, emit);
    });
  }
}
