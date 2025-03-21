import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/ingredient.dart';
import '../widgets/cupcake_preview.dart';
import '../models/custom_cupcake.dart';
import '../models/cupcake_provider.dart';

class BuilderScreen extends StatefulWidget {
  final Product selectedProduct; // Producto seleccionado (sabor de pan)
  final VoidCallback onNavigateToCheckout; // Callback para navegar a CheckoutScreen

  const BuilderScreen({
    Key? key,
    required this.selectedProduct,
    required this.onNavigateToCheckout,
  }) : super(key: key);

  @override
  _BuilderScreenState createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  final List<Ingredient> ingredients = [
    Ingredient(name: 'Chocolate', image: 'assets/chocolate.png'),
    Ingredient(name: 'Fresa', image: 'assets/fresa.png'),
    Ingredient(name: 'Chispas', image: 'assets/chispas.png'),
    Ingredient(name: 'Caramelo', image: 'assets/caramelo.png'),
  ];

  void toggleIngredient(int index) {
    setState(() {
      ingredients[index].isSelected = !ingredients[index].isSelected;
    });
  }

  void finalizeCupcake() {
    // Obtén los ingredientes seleccionados
    final selectedIngredients = ingredients.where((i) => i.isSelected).toList();

    // Crea un cupcake personalizado
    final customCupcake = CustomCupcake(
      flavor: widget.selectedProduct.title,
      ingredients: selectedIngredients.map((i) => i.name).toList(),
    );

    // Agrega el cupcake al estado global
    Provider.of<CupcakeProvider>(context, listen: false).addCupcake(customCupcake);

    // Muestra un mensaje de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Cupcake "${customCupcake.flavor}" con ${customCupcake.ingredients.join(', ')} agregado a Checkout.',
        ),
      ),
    );

    // Notifica a HomePage que debe cambiar al índice de CheckoutScreen
    widget.onNavigateToCheckout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personaliza tu ${widget.selectedProduct.title}'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3, // Ajusta el espacio que ocupa la imagen
            child: CupcakePreview(ingredients: ingredients),
          ),
          const SizedBox(height: 8), // Reduce el espacio entre la imagen y los botones
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                ingredients.length,
                (index) {
                  final ingredient = ingredients[index];
                  return ChoiceChip(
                    label: Text(ingredient.name),
                    selected: ingredient.isSelected,
                    onSelected: (_) => toggleIngredient(index),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16), // Reduce el espacio entre los botones de ingredientes y el botón "Finalizar Cupcake"
          ElevatedButton(
            onPressed: finalizeCupcake,
            child: const Text('Finalizar Cupcake'),
          ),
          const Spacer(), // Agrega un espacio flexible para empujar los botones hacia arriba
        ],
      ),
    );
  }
}
