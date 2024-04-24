import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customCard extends StatelessWidget {
  const customCard({super.key, required this.image, required this.headline, required this.content});
  final String image ;
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
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 15),
               Text(
                headline,
                style: GoogleFonts.lato(fontSize: 26, color: Colors.white, fontWeight:FontWeight.w900 ),
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