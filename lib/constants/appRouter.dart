import 'package:counter_bloc/bloc/addtask/addtask_bloc.dart';
import 'package:counter_bloc/bloc/login/login_bloc.dart';
import 'package:counter_bloc/view/addtask_page.dart';
import 'package:counter_bloc/view/fname_page.dart';
import 'package:counter_bloc/view/home_page.dart';
import 'package:counter_bloc/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/fname/fname_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/todo/todo_bloc.dart';
import '../view/onboard_page.dart';
import '../view/user_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return null;
      case '/user_page':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => TodoBloc(),
                  child: UserPage(),
                ));
      case '/login_page':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginPage(),
          ),
        );
      case '/onboard_page':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: OnboardingExample(user: settings.arguments as User),
          ),
        );
      case '/fname_page':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FnameBloc(),
            child: FnamePage(
              user: settings.arguments as User,
            ),
          ),
        );
      case '/home_page':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc(),
            child: HomePage(
              user: settings.arguments as User,
            ),
          ),
        );
      case '/addtask_page':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AddTaskBloc(),
            child: AddTaskPage(
              user: settings.arguments as User,
            ),
          ),
        );
    }
  }
}
