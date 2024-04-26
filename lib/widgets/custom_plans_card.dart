import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPlansCard extends StatelessWidget {
  const CustomPlansCard(
      {super.key, required this.headline, required this.subheading, required this.route,});
  // final String image ;
  final String headline;
  final String subheading;
  final Widget route;
  // void onTap(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                style: GoogleFonts.lato(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              Text(
                subheading,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                 // minimumSize: const Size(340, 60),
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.yellow,
                  ),
                ),
                child: Text(
                  "Learn more",
                  style: GoogleFonts.lato(
                    color: Colors.yellow,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
