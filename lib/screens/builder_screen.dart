import 'package:flutter/material.dart';
import '../models/ingredient.dart';
import '../widgets/cupcake_preview.dart';

class BuilderScreen extends StatefulWidget {
  @override
  _BuilderScreenState createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  final List<Ingredient> ingredients = [
    Ingredient(name: 'Chocolate', image: 'assets/chocolate.png'),
    Ingredient(name: 'Fresa', image: 'assets/fresa.png'),
    Ingredient(name: 'Vainilla', image: 'assets/vainilla.png'),
    Ingredient(name: 'Chispas', image: 'assets/chispas.png'),
  ];

  void toggleIngredient(int index) {
    setState(() {
      ingredients[index].isSelected = !ingredients[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: CupcakePreview(ingredients: ingredients)),
        Wrap(
          spacing: 8,
          children: List.generate(
            ingredients.length,
            (index) => ChoiceChip(
              label: Text(ingredients[index].name),
              selected: ingredients[index].isSelected,
              onSelected: (_) => toggleIngredient(index),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/checkout'),
          child: Text('Finalizar Pedido'),
        ),
      ],
    );
  }
}
