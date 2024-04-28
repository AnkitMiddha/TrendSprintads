import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/pages/ourplans/extras.dart';
import 'package:loginpage/pages/ourplans/mix.dart';
import 'package:loginpage/pages/ourplans/separate.dart';
import 'package:loginpage/pages/privacy_policy.dart';
import 'package:loginpage/pages/upi_page.dart';
import 'package:loginpage/widgets/custom_plans_card.dart';

class OurPlans extends StatefulWidget {
  const OurPlans({super.key});

  @override
  State<OurPlans> createState() => _OurPlansState();
}

class _OurPlansState extends State<OurPlans> {
  void signUserOut() {
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }

  // static Future<bool> init(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 55, 83),
      appBar: AppBar(
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
                "Our Campaigns",
                style: GoogleFonts.lato(
                    color: Colors.yellow,
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 15,
              ),
               OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const UpiPage()));
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.yellow,
                  ),
                ),
                child: Text(
                  'Buy A Plan',
                  style: GoogleFonts.lato(
                    color: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(height:10),
              CustomPlansCard(
                headline: "Mix",
                subheading: subheading[0],
                route: const Mix(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomPlansCard(
                headline: "Separate",
                subheading: subheading[1],
                route: const Separate(),
              ),
              CustomPlansCard(
                  headline: "Special",
                  subheading: subheading[2],
                  route: const Extras()),
              const SizedBox(
                height: 12,
              ),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Refer to our',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const PrivacyPolicy()));
                      },
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> subheading = [
  "In this category we campaign at all platforms, providing comprehensive social media marketing solutions tailored to your business needs. it's type is given below",
  "In this category we campaign at specific platform to create targeted marketing strategies that align with the unique features and user demographics of each social media network it's type is given below",
  "it include campaigns designed for specific time and businesses  require careful planning and a deep understanding of industry trends, seasonal opportunities, and business objectives.",
];
// List<String> content =[
//  """SOCIAL MEDIA ADS with 10 thousand engagement Costs Rs 5500 

// SOCIAL MEDIA ADS with 20 thousand engagement Costs Rs 10000

// SOCIAL MEDIA ADS with 1 lack engagement Costs Rs 45000

// SOCIAL MEDIA ADS with 5 lack engagement Costs Rs 200000

// SOCIAL MEDIA ADS with 10 lack engagement Costs Rs 350000

// SOCIAL MEDIA ADS with unlimited engagement Costs Rs 500000""",
// """ 
// Facebook ADS with 1 lack engagement Costs RS 50000

// Instagram ADS with 1 lack engagement Costs RS 50000

// Whatsapp ADS (api non api) with 1 lack engagement Costs RS 50000

// SMS ADS (specific dlt) with 1 lack engagement Costs RS 20000
// """


// ];