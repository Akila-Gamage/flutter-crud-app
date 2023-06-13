import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text("List View"),
          ),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text("Grid View"),
          )
        ],
      ),
    );
  }
}