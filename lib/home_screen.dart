
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loginpage/components/bottom_navigationbar.dart';
import 'package:loginpage/pages/our_services.dart';
import 'package:loginpage/widgets/customCard.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void signUserOut() {
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TrendSprint Ads", style: TextStyle(color: Colors.white)),
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
              Image.asset('assets/images/vsn.png'),
              const SizedBox(height: 20),
              _buildSectionTitle('About TrendSprint Ads'),
              CustomCard(image: 'assets/images/home.png', headline: 'Our Vision', content: content[0]),
              CustomCard(image: 'assets/images/team1.png', headline: 'Our Team', content: content[1]),
              CustomCard(image: 'assets/images/socialmedia.png', headline: 'Our Services', content: content[2]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }   
}

List<String> content =[
 ' Our vision at Trendsprint Ads is to empower businesses worldwide to thrive and expand their social media marketing through strategic and cost-effective digital marketing solutions. In today\'s fast-paced digital landscape, we are committed to providing comprehensive support and innovative strategies that propel our clients towards unparalleled success. Let\'s elevate your brand together with our social media marketing agency and conquer the online realm!'
,'Our team is made up of experienced digital media marketers and web developers who are dedicated to helping businesses to succeed in online campaign. We are passionate about social media and stay up-to-date on the latest trends and best practises to ensure our clients get the best results.'
,'We offer variety of social media advertising and campaigning services, including social media management, advertising, content creation, lead generation and many more. Our services are designed to help businesses increase their online presence and reach their target audience.'
];
