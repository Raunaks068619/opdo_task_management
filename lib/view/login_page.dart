import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                    "https://raw.githubusercontent.com/Raunaks068619/studon/main/lib/AuthPage.png",
                    height: double.infinity,
                    fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Image.network(
                          "https://raw.githubusercontent.com/Raunaks068619/studon/main/lib/Logon%20Big.png",
                          width: width < 600 ? 100 : width * 0.08,
                          height: width < 600 ? 100 : width * 0.08),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "opdo",
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 116, 145, 242),
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text("A task management app",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is GoogleLoginSuccess) {
                            Fluttertoast.showToast(
                                msg: state.msg,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.of(context)
                                .pushReplacementNamed(state.route,arguments: state.user);
                          } else if (state is GoogleLoginFailure) {
                            Fluttertoast.showToast(
                                msg: state.msg,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        builder: (context, state) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<LoginBloc>()
                                    .add(GoogleLoginPressed());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(10, 0, 0, 0),
                                      blurRadius: 14,
                                      spreadRadius: 1,
                                      offset: Offset(10, 6),
                                    ),
                                  ],
                                ),
                                child: Image.network(
                                  "https://raw.githubusercontent.com/Raunaks068619/studon/main/lib/GoogleSigninPNG(1).png",
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Container(
                    // color: Color.fromARGB(255, 116, 145, 242),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is GoogleLoginInitial) {
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (event) {
                                  context.read<LoginBloc>().add(OnHover());
                                },
                                onExit: (event) {
                                  context.read<LoginBloc>().add(OnExit());
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    print("linkedin Pressed");
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Made by Raunak Singh  ",
                                        style: GoogleFonts.poppins(
                                            color: state.defaultColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Image.network(
                                        "https://cdn-icons-png.flaticon.com/512/174/174857.png",
                                        width: 20,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Text("Did not work");
                          },
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is GoogleLoginInitial) {
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (val) {
                                  if (val.down == false) {
                                    context.read<LoginBloc>().add(OnHover());
                                  } else {
                                    print("didnotwork");
                                  }
                                },
                                onExit: (val) {
                                  if (val.down == false) {
                                    context.read<LoginBloc>().add(OnExit());
                                  } else {
                                    print("didnotwork");
                                  }
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    print("github Pressed");
                                  },
                                  child: Row(
                                    children: [
                                      Image.network(
                                        "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
                                        width: 40,
                                      ),
                                      width > 600
                                          ? Text(
                                              "Project on Github",
                                              style: GoogleFonts.poppins(
                                                  // color: ,
                                                  color: state.defaultColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          : Text(""),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Text("Didnt work");
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
