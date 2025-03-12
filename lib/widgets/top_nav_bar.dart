import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/settings_page.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSettings;

  const TopNavBar({this.isSettings = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: isSettings
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            )
          : null, // No poner nada en HomePage para que el botón esté en `actions`
      actions: !isSettings
          ? [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
