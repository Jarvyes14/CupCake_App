import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cupcake_provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cupcakes = Provider.of<CupcakeProvider>(context).cupcakes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de tu pedido'),
      ),
      body: cupcakes.isEmpty
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
    );
  }
}
