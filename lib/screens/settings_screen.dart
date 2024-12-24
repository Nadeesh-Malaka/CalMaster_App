import 'package:flutter/material.dart';
import 'custom_drawer.dart'; // Import the custom drawer file

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // State variables
  bool _notificationsEnabled = true;
  String _selectedTheme = "Dark";
  double _fontSize = 16;

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
                  const SizedBox(
                      height: 30), // Spacing between Icon and Content

                  // Main Content (Settings Page Content)
                  Expanded(
                    child: ListView(
                      children: [
                        // Section Title
                        const Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Notifications Toggle
                        SwitchListTile(
                          title: const Text(
                            "Enable Notifications",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          value: _notificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              _notificationsEnabled = value;
                            });
                          },
                          activeColor: Colors.blue,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.white24,
                        ),
                        const Divider(color: Colors.white24),

                        // Theme Selection (Dropdown)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "App Theme",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            DropdownButton<String>(
                              value: _selectedTheme,
                              dropdownColor: const Color(0xFF040C63),
                              style: const TextStyle(color: Colors.white),
                              items: const [
                                DropdownMenuItem(
                                  value: "Light",
                                  child: Text("Light"),
                                ),
                                DropdownMenuItem(
                                  value: "Dark",
                                  child: Text("Dark"),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedTheme = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        const Divider(color: Colors.white24),

                        // Font Size Slider
                        const Text(
                          "Font Size",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Slider(
                          value: _fontSize,
                          min: 12,
                          max: 24,
                          divisions: 4,
                          label: _fontSize.round().toString(),
                          activeColor: Colors.blue,
                          inactiveColor: Colors.white24,
                          onChanged: (value) {
                            setState(() {
                              _fontSize = value;
                            });
                          },
                        ),
                        const Divider(color: Colors.white24),

                        // Privacy Settings
                        ListTile(
                          leading: const Icon(Icons.privacy_tip,
                              color: Colors.white),
                          title: const Text(
                            "Privacy Policy",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                          onTap: () {
                            // Show a simple alert dialog for demonstration
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Privacy Policy"),
                                  content: const Text(
                                      "This is where the app's privacy policy would be shown."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const Divider(color: Colors.white24),

                        // About
                        ListTile(
                          leading: const Icon(Icons.info, color: Colors.white),
                          title: const Text(
                            "About",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                          onTap: () {
                            // Show a simple alert dialog for demonstration
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("About CalMaster"),
                                  content: const Text(
                                      "CalMaster is a versatile app offering calculators and more."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Footer Section
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
