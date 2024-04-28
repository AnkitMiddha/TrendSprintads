import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitalCard extends StatelessWidget {
  const DigitalCard({super.key,  required this.headline, required this.content});
  final String headline;
  final String content;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        color: const Color.fromARGB(255, 34, 44, 67),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
               Text(
                headline,
                style: GoogleFonts.lato(fontSize: 22, color: Colors.white, fontWeight:FontWeight.w900 ),
               // TextStyle(),
              ),
              const SizedBox(height: 10),
               Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  
}
}