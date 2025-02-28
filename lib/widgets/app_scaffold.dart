import 'package:cupcake_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const AppScaffold({required this.body, required this.title}); //Toma dos parametros y los pasa a las propiedades de la clase

  @override
  Widget build(BuildContext context) {
    return const Scaffold( //Widget que implementa la estructura visual básica
      bottomNavigationBar: BNavigator(),
      body: Center(child: Text('Hello, World!')),
    );
  }
}
