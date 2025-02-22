import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'SweetBite',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 4, // Número de elementos en la cuadrícula
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Center(
                child: Text(
                  'Producto ${index + 1}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
