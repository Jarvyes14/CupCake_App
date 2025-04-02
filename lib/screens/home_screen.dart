import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products; // Lista de sabores de pan
  final Function(Product) onProductSelected; // Callback para manejar la selección de un producto

  const HomeScreen({
    Key? key,
    required this.products,
    required this.onProductSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sabores de Pan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas en la cuadrícula
          ),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                onProductSelected(product); // Llama al callback con el producto seleccionado
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: product.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(product.image, height: 80),
                    const SizedBox(height: 12),
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
