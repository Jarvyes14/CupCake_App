import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cupcake_provider.dart';
import '../services/blockchain_service.dart';

class CheckoutScreen extends StatelessWidget {
  final BlockchainService blockchainService;

  CheckoutScreen({required this.blockchainService});

  Future<void> uploadToBlockchain(BuildContext context) async {
    final cupcakes = Provider.of<CupcakeProvider>(context, listen: false).cupcakes;

    if (cupcakes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay cupcakes para subir a la blockchain.')),
      );
      return;
    }

    // Verificar que no haya valores nulos o vacíos
    for (final cupcake in cupcakes) {
      if (cupcake.flavor.isEmpty || cupcake.ingredients.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Hay cupcakes con datos incompletos.')),
        );
        return;
      }
    }

    // Preparar datos para el contrato
    final flavors = cupcakes.map((cupcake) => cupcake.flavor).toList();
    final ingredients = cupcakes.map((cupcake) => cupcake.ingredients).toList();


    try {
      print('Flavors: $flavors');
      print('Ingredients: $ingredients');
      await blockchainService.addOrder(flavors, ingredients);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cupcakes subidos a la blockchain con éxito.')),
      );
      // de aqui no pasa
      print('Flavors: $flavors');
      print('Ingredients: $ingredients');
    } catch (e) {
      print('Error al subir a la blockchain: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al subir a la blockchain: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cupcakes = Provider.of<CupcakeProvider>(context).cupcakes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de tu pedido'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cupcakes.isEmpty
                ? const Center(
                    child: Text(
                      'No has agregado cupcakes a tu pedido.',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: cupcakes.length,
                    itemBuilder: (context, index) {
                      final cupcake = cupcakes[index];
                      return ListTile(
                        title: Text(cupcake.flavor),
                        subtitle: Text('Ingredientes: ${cupcake.ingredients.join(', ')}'),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => uploadToBlockchain(context),
            child: const Text('Subir a Blockchain'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
