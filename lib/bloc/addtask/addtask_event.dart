import 'package:counter_bloc/modal/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AddTaskEvent extends Equatable {}

class UploadTaskClicked extends AddTaskEvent {
TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime date;
  UploadTaskClicked({
    required this.titleController,
    required this.descriptionController,
    required this.date,
  });
  @override
  List<Object> get props => [titleController,
        descriptionController,
        date,
      ];
}
