import 'package:flutter/material.dart';
import 'custom_cupcake.dart';

class CupcakeProvider with ChangeNotifier {
  final List<CustomCupcake> _cupcakes = [];

  List<CustomCupcake> get cupcakes => _cupcakes;

  void addCupcake(CustomCupcake cupcake) {
    _cupcakes.add(cupcake);
    notifyListeners(); // Notifica a los widgets que dependen de este estado
  }
}