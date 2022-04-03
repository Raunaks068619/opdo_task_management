import 'package:bloc/src/bloc.dart';
import 'package:counter_bloc/bloc/login/login_state.dart';
import 'package:counter_bloc/services/read_user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../bloc/login/login_event.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

String? name;
String? imageUrl;

Future<void> signInWithGoogle(
    GoogleLoginPressed event, Emitter<LoginState> emit) async {
  // Initialize Firebase
  try {
    emit(GoogleLoginLoading(msg: 'Loading'));

    await Firebase.initializeApp();
    User? user;
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithPopup(authProvider);

    user = userCredential.user;
    if (user != null) {
      print("Login Success");
    }
    emit(GoogleLoginSuccess(msg: 'Success', route: '/fname_page', user: user));
  } on Exception catch (e) {
    print(e);
    print("LoginFailed");
    emit(GoogleLoginFailure(msg: "Login Failed"));
  }
}
