import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String title;
  String description;
  bool isDone;
  int urgency;
  Timestamp date;

  TaskModel(
      {required this.title,
      required this.description,
      required this.isDone,
      required this.urgency,
      required this.date});
}


