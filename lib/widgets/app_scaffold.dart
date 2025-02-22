import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const AppScaffold({required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Personalizar Cupcake'),
              onTap: () => Navigator.pushReplacementNamed(context, '/builder'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Checkout'),
              onTap: () => Navigator.pushReplacementNamed(context, '/checkout'),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
