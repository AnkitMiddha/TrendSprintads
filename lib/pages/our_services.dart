
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/widgets/customCard.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  void signUserOut() {
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TrendSprint", style: TextStyle(color: Colors.white)),
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
            _buildSectionTitle('Digital Marketing Services for Trendsprint ads'),
              CustomCard(image: 'assets/images/os1.png', headline: 'Social Media Management', content: content[0] ),
              CustomCard(image: 'assets/images/os2.png', headline: 'Branding and Identity', content: content[1]),
              CustomCard(image:'assets/images/os1.png' , headline: 'Influencer Marketing', content: content[2]),
            
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
              style: const TextStyle(color: Colors.white, fontSize: 15),
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
List<String> content = [
  "Our social media management services are designed to help businesses increase brand awareness, generate more leads, and improve customer engagement. We create and share high-quality content that resonates with your target audience and help you build a strong social media presence.",
  "We'll help you create a strong brand identity that resonates with your target audience. From logo design to brand messaging, we'll ensure your brand is consistent across all channels and conveys the right message.",
  "Our influencer marketing services are designed to help businesses reach their target audience through trusted influencers. With social media marketing agency  We identify and partner with influencers who align with your brand values and create effective influencer campaigns that drive engagement and conversions.",
];
