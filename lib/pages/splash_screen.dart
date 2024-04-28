import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/pages/auth_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedSplashScreen(
        splash: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: LottieBuilder.asset(
                'assets/lottie/Animation.json',
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(
              "TrendSprint Ads",
              style: GoogleFonts.lato(
                color: Colors.yellow,
                fontSize: 37,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        nextScreen: const AuthPage(),
        splashIconSize: 500,
        duration: 4600,
        backgroundColor: const Color.fromARGB(255, 42, 55, 83),
      ),
    );
  }
}
