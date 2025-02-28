import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  const BNavigator ({Key? key}) : super(key: key);
  
  @override
  _BNavigatorState createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons. home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons. cake),
          label: 'Create'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons. shopping_cart),
          label: 'Checkout'
        ),
      ]
    );
  }
}