import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Checkout',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Resumen de tu pedido', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Regresar al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
