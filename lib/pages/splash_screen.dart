import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_website/pages/home_page.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  Future<void> loadSplash() async {
    await Future.delayed(const Duration(seconds: 3), ondoneLoading);
  }

  void ondoneLoading() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 5),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return const HomePage();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.bounceInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(51, 51, 51, 1), Color.fromRGBO(170, 170, 170, 1)],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'lottie/Animation - 1721124952081.json',
                    height: isMobile ? 200 : 400,
                    width: isMobile ? 200 : 400,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Loading......",
                    style: GoogleFonts.pressStart2p(
                      fontSize: isMobile ? 24 : 38,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      .animate(
                        delay: 1000.ms,
                        onPlay: (controller) => controller.loop(),
                      )
                      .shimmer(delay: 500.ms),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
