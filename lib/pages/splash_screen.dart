import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/pages/auth_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(splash: Column(
      children: [ Center(
        child: LottieBuilder.asset('assets/lottie/Animation.json',),
        
      )],
      
    ), nextScreen: const AuthPage(),splashIconSize:400 ,duration: 2000,backgroundColor: const Color.fromARGB(255, 42, 55, 83),
  );
    
  }
}
