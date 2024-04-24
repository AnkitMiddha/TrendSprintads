import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.yellow, fontSize: 26,fontWeight: FontWeight.bold),
            ),
          ),
          // const Expanded(
          //   child: Divider(
          //     thickness: 0.8,
          //     color: Colors.yellow,
          //   ),
        
        ],
      ),
    );
  }   
}
