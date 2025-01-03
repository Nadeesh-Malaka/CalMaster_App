import 'package:flutter/material.dart';

class UniCal extends StatefulWidget {
  const UniCal({Key? key}) : super(key: key);

  @override
  _UniCalState createState() => _UniCalState();
}

class _UniCalState extends State<UniCal> {
  final TextEditingController _controller = TextEditingController();
  String fromUnit = 'cm';
  String toUnit = 'm';
  String result = '';

  final Map<String, double> conversionRates = {
    'cm-m': 0.01,
    'm-cm': 100.0,
    'm-km': 0.001,
    'km-m': 1000.0,
  };

  void convert() {
    try {
      double value = double.parse(_controller.text);
      double rate = conversionRates['$fromUnit-$toUnit'] ?? 1.0;
      setState(() {
        result = (value * rate).toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        result = 'Error';
      });
    }
  }

  void clearFields() {
    setState(() {
      _controller.clear();
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                ),
                const Text(
                  'Unit Converter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter value',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton<String>(
                      dropdownColor: Colors.blue[900], // Dropdown background
                      value: fromUnit,
                      items: ['cm', 'm', 'km']
                          .map((unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(
                                  unit,
                                  style: const TextStyle(
                                    fontSize: 18, // Larger font
                                    color: Colors.white, // White text
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          fromUnit = value!;
                        });
                      },
                      iconEnabledColor: Colors.white, // Arrow color
                    ),
                    Icon(Icons.swap_horiz,
                        color: Colors.white, size: 30), // Larger icon
                    DropdownButton<String>(
                      dropdownColor: Colors.blue[900], // Dropdown background
                      value: toUnit,
                      items: ['cm', 'm', 'km']
                          .map((unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(
                                  unit,
                                  style: const TextStyle(
                                    fontSize: 18, // Larger font
                                    color: Colors.white, // White text
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          toUnit = value!;
                        });
                      },
                      iconEnabledColor: Colors.white, // Arrow color
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: convert,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Convert',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: clearFields,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Clear',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Result: $result',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
    );
  }
}
