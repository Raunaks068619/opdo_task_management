import 'package:counter_bloc/bloc/fname/fname_event.dart';
import 'package:counter_bloc/bloc/fname/fname_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/add_user_data.dart';

class FnameBloc extends Bloc<FnameEvent,FnameState>{
  FnameBloc(): super(FnameInitial(controller: TextEditingController())){
    on<AddFNamePressed>((event, emit) async {
      //Add Fname function
      await addFname(event, emit); 
    });
  }

}