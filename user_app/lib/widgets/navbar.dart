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
            onTap: () {
              Navigator.pushNamed(context, '/mainpage');
            },
          ),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text("Grid View"),
            onTap: () {
              Navigator.pushNamed(context, '/secondpage');
            },
          ),
          Card(
            color: Colors.red,
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          )
        ],
      ),
    );
  }
}