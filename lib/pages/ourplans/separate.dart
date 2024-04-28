import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/widgets/extras_card.dart';

class Separate extends StatelessWidget {
  const Separate({super.key});
  void signUserOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 55, 83),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text("TrendSprint Ads",
            style: GoogleFonts.lato(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 42, 55, 83),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 42, 55, 83),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Separate",
                style: GoogleFonts.lato(fontSize: 22, color: Colors.yellow),
              ),
              const SizedBox(
                height: 10,
              ),
              ExtrasCard(
                  headline: "Facebook Ads", content: content[0], costs: '₹50000'),
              ExtrasCard(
                  headline: "Instagram Ads",
                  content: content[1],
                  costs: '₹50000'),
              ExtrasCard(
                  headline: "Whatsapp Ads", content: content[2], costs: '₹50000'),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> content = [
  'Facebook ADS with 1 lack engagement Costs RS 50000',
  'Instagram ADS with 1 lack engagement Costs RS 50000',
  'Whatsapp ADS (api non api) with 1 lack engagement Costs RS 50000',
  'SMS ADS (specific dlt) with 1 lack engagement Costs RS 20000',
];
