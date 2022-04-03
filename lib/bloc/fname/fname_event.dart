import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FnameEvent extends Equatable{}

class AddFNamePressed extends FnameEvent{
  TextEditingController controller;
  AddFNamePressed({required this.controller}); 
  @override
  List<Object> get props => [controller];
}