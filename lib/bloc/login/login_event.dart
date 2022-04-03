import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class LoginEvent extends Equatable {}

class GoogleLoginPressed extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnHover extends LoginEvent {
  // Color hoverColor;
  // OnHover({required this.hoverColor});
  @override
  List<Object?> get props => [];
}

class OnExit extends LoginEvent {
  @override
  List<Object?> get props => [];
}
