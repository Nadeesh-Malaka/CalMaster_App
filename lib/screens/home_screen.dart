import 'package:calmaster/screens/uni_cal.dart';
import 'package:flutter/material.dart';
import 'custom_drawer.dart'; // Import the custom drawer file
import 'simple_Cal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  // Menu Icon (now works with Drawer)
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),

                  // Welcome Section
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Your all-in-one solution for calculations, \nconversions, and more. Simplify your daily \ntasks with our easy-to-use tools!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search Bar
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black),
                          onPressed: () {
                            // Add search functionality
                          },
                        ),
                      ],
                    ),
                  ),

                  // Calculators Section
                  const SizedBox(height: 30),
                  const Text(
                    "Calculators",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Align to start to reduce space
                    children: [
                      // Column 1: "All"
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                8.0), // Adjust padding to reduce space between columns
                        child: Column(
                          children: [
                            Container(
                              height: 37,
                              width: 79,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(70, 0, 0,
                                    0), // Change to non-transparent color
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                // Added Center widget to center the text
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Column 2: "Top"
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                8.0), // Adjust padding to reduce space between columns
                        child: Column(
                          children: [
                            Container(
                              height: 37,
                              width: 79,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(70, 0, 0,
                                    25), // Change to non-transparent color
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                // Added Center widget to center the text
                                child: Text(
                                  "Top",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Column 3: "Recent"
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                8.0), // Adjust padding to reduce space between columns
                        child: Column(
                          children: [
                            Container(
                              height: 37,
                              width: 79,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(70, 0, 0,
                                    25), // Change to non-transparent color
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                // Added Center widget to center the text
                                child: Text(
                                  "Recent",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),

                  //--------Cal Apps start--------------

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Simple Calculator
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SimpleCal(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/simplecal.png', // Replace with your image path
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Simple Cal",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 30),

                        // Unit Calculator
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UniCal(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/unitcal.png', // Replace with your image path
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Unit Cal",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 30),

                        // BMI Calculator
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SimpleCal(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/bmi.png', // Replace with your image path
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "BMI",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 30),

                        // GPA Calculator
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SimpleCal(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/gpa.png', // Replace with your image path
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "GPA Cal",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 30),

                        // Discount Calculator
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SimpleCal(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/discount.png', // Replace with your image path
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Discount Cal",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //--------Cal Apps end--------------

                  //2nd row

                  const SizedBox(height: 30),

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
