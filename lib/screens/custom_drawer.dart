import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'about_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header with Gradient and Logo
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF07139E), // 24% stop
                  Color(0xFF040C63), // 64% stop
                  Color(0xFF020738), // 86% stop
                ],
                stops: [0.24, 0.64, 0.86],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/cal-logo.png',
                    height: 75,
                    width: 75, // Circular logo
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'CalMaster',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // ListTile for Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          // ListTile for Notes
          ListTile(
            leading: const Icon(Icons.note_alt),
            title: const Text('Notes'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          // ListTile for Notifications
          ListTile(
            leading: const Icon(Icons.notification_add),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          // ListTile for Bookmarks
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('BookMarks'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          // ListTile for Profile
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          // ListTile for Settings
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          // ListTile for About
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
          // ListTile for Logout
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoadingScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
