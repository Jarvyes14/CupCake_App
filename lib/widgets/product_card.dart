import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double offset; // Desplazamiento vertical

  const ProductCard({required this.title, this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offset), // Desplazar solo en eje Y
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 4,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
