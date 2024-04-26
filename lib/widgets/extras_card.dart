import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtrasCard extends StatelessWidget {
  const ExtrasCard({super.key, required this.headline, required this.content, required this.costs});
  final String headline;
  final String content;
  final String costs;

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
              const SizedBox(height: 15),
               Text(
                headline,
                style: GoogleFonts.lato(fontSize: 22, color: Colors.white, fontWeight:FontWeight.w900 ),
              ),
              const SizedBox(height: 10),
               Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 12,),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
              color: Colors.yellow,
              width: 1, 
              // You can change the border thickness
            ),
            borderRadius: BorderRadius.circular(15),
                ),
                child: Text(costs,style: GoogleFonts.lato(fontSize:18,fontWeight:FontWeight.w400,color:Colors.yellow),),
              )
            ],
          ),
        ),
      ),
    );
  
}
}