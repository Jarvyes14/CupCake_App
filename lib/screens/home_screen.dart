import 'package:flutter/material.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(title: 'Chocolate', image: 'assets/chocolate.png', price: 5.99, color: Colors.brown),
    Product(title: 'Fresa', image: 'assets/fresa.png', price: 6.49, color: Colors.pink),
    Product(title: 'Vainilla', image: 'assets/vainilla.png', price: 5.79, color: Colors.yellow),
    Product(title: 'Chispas', image: 'assets/chispas.png', price: 4.99, color: Colors.blue),
    Product(title: 'Caramelo', image: 'assets/caramelo.png', price: 5.49, color: Colors.orange),
    Product(title: 'Menta', image: 'assets/menta.png', price: 6.29, color: Colors.green),
    Product(title: 'Oreo', image: 'assets/oreo.png', price: 7.19, color: Colors.black),
    Product(title: 'Frambuesa', image: 'assets/frambuesa.png', price: 6.99, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder( // Cambiar Grid por 
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 80,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          double offset = (index % 2 == 1) ? 60.0 : 0.0; // Desplazar las de la derecha

          return Transform.translate(
            offset: Offset(0, offset),
            child: Container(
              decoration: BoxDecoration(
                color: product.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(product.image, height: 60),
                  SizedBox(height: 8),
                  Text(product.title, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 4),
                  Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
