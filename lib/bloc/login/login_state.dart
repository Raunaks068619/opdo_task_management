import 'package:counter_bloc/bloc/login/login_event.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {}

class GoogleLoginInitial extends LoginState {
  Color defaultColor;
  GoogleLoginInitial({required this.defaultColor});
  @override
  // TODO: implement props
  List<Object?> get props => [defaultColor];
}

class GoogleLoginLoading extends LoginState {
  String msg;
  GoogleLoginLoading({required this.msg});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleLoginSuccess extends LoginState {
  String msg;
  String route;
  User? user;
  GoogleLoginSuccess(
      {required this.msg, required this.route, required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [msg, route, user];
}

class GoogleLoginFailure extends LoginState {
  String msg;
  GoogleLoginFailure({required this.msg});
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
