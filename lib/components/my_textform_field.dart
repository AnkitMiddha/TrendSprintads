import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  const FormFields({super.key, required this.controller, required this.hintText,});
  final TextEditingController  controller;
  final String hintText;
   // final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
    child:  TextFormField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: hintText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fillColor: const Color.fromARGB(255, 42, 55, 83),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey.shade200)),
                    obscureText: false,
                  ), 
    );

  
  }
}