import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Navigation',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(leading: Icon(Icons.home), title: Text('Home')),
        ],
      ),
    );
  }
}
