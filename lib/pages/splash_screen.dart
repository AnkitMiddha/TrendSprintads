import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/pages/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _animation;

  double opacityLevel = 1.0; 
  @override
  void initState() {
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
     _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds:1 ),
    );
    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    // Start the animation after a delay
    Future.delayed(const Duration(seconds: 1), () {

      _controller.forward();
       // Navigate when animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to AuthPage after animation completion
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AuthPage()),
        );
      }
    });
    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: const Color.fromARGB(255, 57, 61, 70),
        child: Stack(
          children: [
            Center(
              child: SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/ts.jpg', ),
                ),
                   // Customize your splash screen logo
              ),
            ),
            // if (!_controller.isCompleted) // Only show login page if animation hasn't completed
            //   Container(), // Placeholder to maintain space for splash screen
            if (_controller.isCompleted) 
            // Show login page once animation completes
            const  AuthPage(),
          ],
        ),
      ),
    );
  }
}