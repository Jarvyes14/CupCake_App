import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/builder_screen.dart';
import 'screens/checkout_screen.dart';

void main() {
  runApp(CupcakeApp()); // Se llama a la funcion runApp() y se le pasa como argumento una instancia de la clase CupcakeApp
}

// Clase CupcakeApp que extiende de StatelessWidget
// StatelessWidget es un widget que no mantiene estado
class CupcakeApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) { // 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cupcake Builder',
      theme: ThemeData.dark(),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => HomeScreen(), // Define el contexto de la ruta '/' (La primera pantalla que se muestra)
        '/builder': (context) => BuilderScreen(),
        '/checkout': (context) => CheckoutScreen(),
      },
    );
  }
}
