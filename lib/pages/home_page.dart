import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para cargar el ABI desde un archivo
import '../screens/builder_screen.dart';
import '../screens/home_screen.dart';
import '../screens/checkout_screen.dart';
import '../models/product.dart';
import '../widgets/bottom_nav_bar.dart';
import '../services/blockchain_service.dart';

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

  // Instancia de BlockchainService
  final BlockchainService _blockchainService = BlockchainService(
    rpcUrl: "http://127.0.0.1:7545", // Cambia esto por tu nodo Ethereum
    privateKey: "0x976ca9291a35c587f3b1e800f6f43b62f15e271decb999ea4bf9ad7c4b67fa98", // Cambia esto por tu clave privada
    contractAddress: "0x792bbDb9D9913245103120d949d2c6516e318030", // Cambia esto por la dirección del contrato
  );

  late Future<void> _initialization; // Para manejar la inicialización del contrato

  @override
  void initState() {
    super.initState();
    _initialization = initializeBlockchainService();
  }

  Future<void> initializeBlockchainService() async {
    try {
      final abi = await rootBundle.loadString('assets/cupcake_orders_abi.json');
      await _blockchainService.initializeContract(abi);
      print('Contrato inicializado correctamente');
    } catch (e) {
      print('Error al inicializar el contrato: $e');
    }
  }

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
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error al inicializar el contrato: ${snapshot.error}'));
        }

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
          CheckoutScreen(blockchainService: _blockchainService), // Pasa BlockchainService
        ];

        return Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}

