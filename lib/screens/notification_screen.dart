import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> updates = [
      "New Calculator Feature Added",
      "Dark Theme Support is Here!",
      "Performance Improvements in v1.2",
      "Bug Fixes and Optimizations",
    ];

    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF07139E),
              Color(0xFF040C63),
              Color(0xFF020738),
            ],
            stops: [0.24, 0.64, 0.86],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menu Icon
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  const SizedBox(height: 30),

                  // Title
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // List of Notifications
                  Expanded(
                    child: ListView.builder(
                      itemCount: updates.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              updates[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: const Icon(Icons.notifications,
                                color: Colors.blue),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
