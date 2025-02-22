import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/builder_screen.dart';
import 'screens/checkout_screen.dart';

void main() {
  runApp(CupcakeApp());
}

class CupcakeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cupcake Builder',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/builder': (context) => BuilderScreen(),
        '/checkout': (context) => CheckoutScreen(),
      },
    );
  }
}
