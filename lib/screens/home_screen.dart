import 'package:flutter/material.dart';
import 'loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
            0xFF07139E), // Example solid color for the AppBar background
        title: const Text('Welcome'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align the content to the left
                children: [
                  // Wrap the Image in ClipOval to make it circular
                  ClipOval(
                    child: Image.asset(
                      'assets/cal-logo.png',
                      height: 75,
                      width:
                          75, // Keep width and height equal for a circular shape
                      fit: BoxFit
                          .cover, // Ensures the image is scaled to fill the circle
                    ),
                  ),

                  const SizedBox(
                      height:
                          10), // Add some space between the image and the text

                  const Text(
                    'CalMaster',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.note_alt),
              title: const Text('Notes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notification_add),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('BookMarks'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings page (if available)
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Navigate to about page (if available)
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoadingScreen()),
                );
              },
            ),
          ],
        ),
      ),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Start off with the best calculators, conversions, and smart features for your daily tasks.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    _buildFeatureCard(
                      context,
                      icon: Icons.calculate,
                      label: "Simple Calc",
                      onTap: () {
                        // Navigate to Simple Calculator screen
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      icon: Icons.accessibility_new,
                      label: "BMI Calc",
                      onTap: () {
                        // Navigate to BMI Calculator screen
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      icon: Icons.school,
                      label: "GPA Calc",
                      onTap: () {
                        // Navigate to GPA Calculator screen
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      icon: Icons.info,
                      label: "About",
                      onTap: () {
                        // Navigate to About screen
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blue,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
