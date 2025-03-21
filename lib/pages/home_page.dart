import 'package:flutter/material.dart';
import '../screens/builder_screen.dart';
import '../screens/home_screen.dart';
import '../screens/checkout_screen.dart';
import '../models/product.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Product? _selectedProduct; // Producto seleccionado para BuilderScreen

  final List<Product> _products = [
    Product(title: 'Chocolate', image: 'assets/chocolate.png', price: 5.99, color: Colors.brown),
    Product(title: 'Fresa', image: 'assets/fresa.png', price: 6.49, color: Colors.pink),
    Product(title: 'Vainilla', image: 'assets/vainilla.png', price: 5.79, color: Colors.yellow),
    Product(title: 'Chispas', image: 'assets/chispas.png', price: 4.99, color: Colors.blue),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onProductSelected(Product product) {
    setState(() {
      _selectedProduct = product;
      _selectedIndex = 1; // Cambia al índice de BuilderScreen
    });
  }

  void _navigateToCheckout() {
    setState(() {
      _selectedIndex = 2; // Cambia al índice de CheckoutScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeScreen(
        products: _products,
        onProductSelected: _onProductSelected, // Pasa el callback
      ),
      _selectedProduct != null
          ? BuilderScreen(
              selectedProduct: _selectedProduct!,
              onNavigateToCheckout: _navigateToCheckout, // Pasa el callback
            )
          : const Center(
              child: Text(
                'Selecciona un sabor de pan para personalizar tu cupcake.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
      CheckoutScreen(), // Pantalla de Checkout
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

