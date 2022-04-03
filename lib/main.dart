import 'package:counter_bloc/bloc/login/login_bloc.dart';
import 'package:counter_bloc/constants/appRouter.dart';
import 'package:counter_bloc/view/fname_page.dart';
import 'package:counter_bloc/view/home_page.dart';
import 'package:counter_bloc/view/login_page.dart';
import 'package:counter_bloc/view/onboard_page.dart';
import 'package:counter_bloc/view/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: FirebaseOptions(
          authDomain: "opdo-3b256.firebaseapp.com",
          apiKey: "AIzaSyBb9IXMD5TqpE8zbhdn-IyJhGXOCLqPi68",
          appId: "1:1002161501774:web:57c64c44fa74755f50351f",
          messagingSenderId: "1002161501774",
          projectId: "opdo-3b256"));
  runApp(MyApp(
    router: AppRouter(),
  ));
}

String initialRoute = '/login_page';

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xFFFAFAFA),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: initialRoute,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context)
              .textTheme, 
        ),
      ),
      // home: HomePage(user: null,),
    );
  }
}
