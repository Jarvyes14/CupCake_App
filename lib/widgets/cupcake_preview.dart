import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class CupcakePreview extends StatelessWidget {
  final List<Ingredient> ingredients;

  const CupcakePreview({required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/cupcake_base.png', width: 150), // Base del cupcake
          ...ingredients.where((i) => i.isSelected).map((ingredient) {
            return Image.asset(ingredient.image, width: 150);
          }).toList(),
        ],
      ),
    );
  }
}
