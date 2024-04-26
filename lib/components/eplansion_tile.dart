import 'package:flutter/material.dart';

class CustomPlan extends StatelessWidget {
  const CustomPlan({super.key, required this.title, required this.subtitle, required this.content});
  final String title;
  final String subtitle;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
    child:  ListView(
        children:  [
          ExpansionTile(
            title: Text(title),
            subtitle: Text(subtitle),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  content,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    
    );
  }
}