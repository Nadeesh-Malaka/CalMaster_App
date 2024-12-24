import 'package:flutter/material.dart';
import 'custom_drawer.dart'; // Import the custom drawer file

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(
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
        child: SafeArea(
          child: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row to align IconButton on the left and "About CalMaster" centered
                  Row(
                    children: [
                      // Menu Icon Button (stays at the start)
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      // Spacer to push the text to the center
                      const Spacer(),
                      // "About CalMaster" text (centered)
                      const Text(
                        "About CalMaster",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      const Spacer(), // Optional: If you want the text to be perfectly centered
                    ],
                  ),

                  const SizedBox(
                      height: 30), // Add spacing between Icon and next section

                  // Main Content
                  Card(
                    color: Colors.white.withOpacity(0.1), // Slight transparency
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          20.0), // Padding for content inside card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),

                          // App Description
                          const Text(
                            "The Cal Master app is designed to simplify and enhance your calculation needs, offering a user-friendly interface, advanced features, and reliable performance. Whether for academic, professional, or personal purposes, it serves as the ultimate solution for all your arithmetic and mathematical tasks.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height:
                                  1.5, // Adjust line spacing for readability
                            ),
                          ),
                          const SizedBox(height: 25),

                          // Developer and other info
                          const Text(
                            "Developed by: Nadeesh Malaka",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "UI: R. Pramode",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),

                          const SizedBox(height: 10),
                          const Text(
                            "Initial Release Date: December 2024",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Version: 1.0",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Footer Section (Optional)
                  const Spacer(),
                  const Center(
                    child: Text(
                      "CalMaster",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
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
