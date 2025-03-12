import 'package:flutter/material.dart';
import 'package:cupcake_app/widgets/top_nav_bar.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(isSettings: true),
      body: Center(
        child: Text('Configuraciones', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
