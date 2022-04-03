import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// AppBar NavBar(double width, User user) {
AppBar NavBar(double width, User user) {
  return AppBar(
    toolbarHeight: width > 600 ? 80 : 50,
    elevation: 0,
    backgroundColor: Color(0xFFFAFAFA),
    leadingWidth: 200,
    leading: Container(
      margin: width > 600
          ? EdgeInsets.fromLTRB(80.0, 30.0, 0.0, 10.0)
          : EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://raw.githubusercontent.com/Raunaks068619/studon/main/lib/Logon%20Big.png",
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "opdo",
            style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 116, 145, 242),
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
        ],
      ),
    ),
    actions: [
      Container(
        margin: width > 600
            ? EdgeInsets.fromLTRB(0.0, 20.0, 80.0, 10.0)
            : EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(10, 0, 0, 0),
                offset: Offset(2, 4),
                blurRadius: 5,
              ),
            ],
          ),
          height: 100,
          // width: 100,
          // margin: EdgeInsets.all(20),

          child: width > 600
              ? InkWell(
                  hoverColor: Colors.black,
                  enableFeedback: true,
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(user.photoURL.toString()),
                        backgroundColor: Colors.amber,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        // "Raunak Singh",
                        user.displayName as String,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            // fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
              : CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(user.photoURL as String),
                  backgroundColor: Colors.amber,
                ),
        ),
      ),
    ],
  );
}
