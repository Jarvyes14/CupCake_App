import 'package:flutter/material.dart';
import 'package:cupcake_app/widgets/bottom_nav_bar.dart';
import 'package:cupcake_app/widgets/top_nav_bar.dart';
import '../screens/builder_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    BuilderScreen(),
    CheckoutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(isSettings: false),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

