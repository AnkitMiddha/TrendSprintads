import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loginpage/home_screen.dart';
import 'package:loginpage/pages/contact_page.dart';
import 'package:loginpage/pages/our_plans.dart';
import 'package:loginpage/pages/our_services.dart';

class BottomBar extends StatefulWidget 
{
   
  const BottomBar({super.key, });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int _selectedIndex = 0; // To keep track of the selected index

  static const List<Widget> _widgetOptions = [
    HomeScreen(), 
    OurServices(), 
    ContactPage(), 
  OurPlans(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow, 
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
         backgroundColor: const Color.fromARGB(255, 34, 44, 67),
         type: BottomNavigationBarType.fixed,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.designtools), 
            label: 'Our Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.global), 
            label: 'Our Plans',
          ),
        ],
      ),
    );
  }
}