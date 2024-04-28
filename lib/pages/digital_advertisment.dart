import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/widgets/digitalcard.dart';
class DigitalAdvertisment extends StatelessWidget {
  const DigitalAdvertisment({super.key});
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
        title: Text("TrendSprint",
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
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 42, 55, 83),
        ),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Text(
                "Digital Advertisement Over Traditional",
                style: GoogleFonts.lato(
                    fontSize: 22,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              DigitalCard(
                  headline: "Targeted Reach", content: content[0],),
               DigitalCard(
                  headline: "Cost-Effectivness",
                  content: content[1],
                 ),
                   DigitalCard(
                  headline: "Measurable Results",
                  content: content[2],
                  ),
               DigitalCard(
                  headline: "Global Reach",
                  content: content[3],
                  ),
                   DigitalCard(
                  headline: "Engagmennt and Interarctivity",
                  content: content[4],
                ),
                    DigitalCard(
                  headline: "Conclusion",
                  content: content[5],
                 ),

            ],
          ),
        ),
      ),
    );
  }
}

List<String> content = [
  'Digital advertising allows businesses to target specific demographics, interests, and behaviors of their audience with precision. According to Statista, targeted advertising can increase conversion rates by up to 70%.',
  'Compared to traditional advertising, digital ads often cost less and offer better ROI. For instance, a study by eMarketer found that digital advertising typically costs 45% less than traditional advertising methods.',
  'With digital advertising, businesses can track metrics in real-time, such as clicks, impressions, conversions, and return on investment. This level of data-driven insights enables businesses to optimize their campaigns for better performance.',
  "Digital advertising provides the opportunity to reach a global audience, breaking geographical barriers. According to GlobalWebIndex, 42% of the world's population is active on social media, offering a vast potential audience for digital advertisers.",
  " Digital ads can be interactive, engaging, and shareable, leading to higher levels of brand interaction and customer engagement. Interactive ads generate twice as many conversions as static ads, as reported by Business Insider.",
  "By updating to digital advertising, businesses can stay ahead of the competition, maximize their marketing budgets, and connect with their target audience in meaningful ways. It's not just about keeping up with trends; it's about leveraging the most effective tools available to grow and succeed in today's digital landscape.",
];
