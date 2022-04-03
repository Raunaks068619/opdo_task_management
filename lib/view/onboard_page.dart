import 'package:concentric_transition/concentric_transition.dart';
import 'package:counter_bloc/view/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../constants/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageData {
  final String? title;
  final String? image;
  final Color bgColor;
  final Color textColor;

  PageData({
    this.title,
    this.image,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class OnboardingExample extends StatelessWidget {
  final User user;
  OnboardingExample({
    Key? key,
    required this.user,
  }) : super(key: key);

  final List<PageData> pages = [
    PageData(
      image:
          "https://raw.githubusercontent.com/Raunaks068619/studon/main/lib/imagesFolder/HomePage%20-%20Old%20User.png",
      title: "Manage your tasks",
      // textColor: Colors.white,
      bgColor: Color(0xFF0043D0),
    ),
    PageData(
      image:
          "https://raw.githubusercontent.com/Raunaks068619/studon/main/lib/imagesFolder/HomePage%20-%20NewUser.png",
      title: "Minimal Design",
      bgColor: Color(0xFFFFFFFF),
    ),
    PageData(
      image:
          "https://raw.githubusercontent.com/Raunaks068619/studon/main/lib/imagesFolder/HomePage%20-%20HoverState.png",
      title: "Optimum Features",
      bgColor: Color(0xFF0043D0),
      // textColor: Colors.white,
    ),
  ];

  List<Color> get colors => pages.map((p) => p.bgColor).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ConcentricPageView(
            colors: colors,
//          opacityFactor: 1.0,
//          scaleFactor: 0.0,
            onFinish: () {
              Navigator.pushNamed(context, '/user_page', arguments: user);
            },
            onChange: (index) {
              print(index);
            },
            radius: 30,
            curve: Curves.ease,
            duration: Duration(seconds: 2),
            verticalPosition: 0.8,
            itemCount: 3,
//          direction: Axis.vertical,
//          itemCount: pages.length,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (index, value) {
              PageData page = pages[index];
              // For example scale or transform some widget by [value] param
              //            double scale = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
              // if (index != 3) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Container(
                        child: Image.network(
                      "${page.image}",
                      width: MediaQuery.of(context).size.width * 0.6,
                    )),
                    SizedBox(height: 20),
                    Text(
                      page.title!,
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: page.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            //else {
            //   return Expanded(
            //       child: Container(color: Colors.white, child: Stack()));
            // }
            // },
            ),
      ),
    );
  }
}
