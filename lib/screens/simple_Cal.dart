import 'package:flutter/material.dart';
import 'custom_drawer.dart'; // Import the custom drawer file

class SimpleCal extends StatefulWidget {
  const SimpleCal({Key? key}) : super(key: key);

  @override
  _SimpleCalState createState() => _SimpleCalState();
}

class _SimpleCalState extends State<SimpleCal> {
  String input = ''; // User input
  String result = '0'; // Calculated result

  // Function to handle button presses
  void onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
        try {
          result = _calculateResult(input);
        } catch (e) {
          result = 'Error';
        }
      } else if (value == 'C') {
        input = '';
        result = '0';
      } else {
        input += value;
      }
    });
  }

  // Function to evaluate the result
  String _calculateResult(String expression) {
    expression = expression.replaceAll('×', '*').replaceAll('%', '/100');
    final tokens = RegExp(r'(\d+|\+|\-|\*|\/)') // Regex for operators/numbers
        .allMatches(expression)
        .map((match) => match.group(0))
        .toList();

    double total = double.parse(tokens[0]!);

    for (int i = 1; i < tokens.length; i += 2) {
      final operator = tokens[i];
      final operand = double.parse(tokens[i + 1]!);

      if (operator == '+') {
        total += operand;
      } else if (operator == '-') {
        total -= operand;
      } else if (operator == '*') {
        total *= operand;
      } else if (operator == '/') {
        total /= operand;
      }
    }

    return total.toString();
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Content (Calculator and Buttons)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 20),

                    // Screen Title
                    const Center(
                      child: Text(
                        "Simple Cal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Calculator UI
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF040C63),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Display Section
                          Container(
                            height: 60,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  input,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  result,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Buttons
                          GridView.count(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: [
                              _buildButton("7"),
                              _buildButton("8"),
                              _buildButton("9"),
                              _buildButton("+"),
                              _buildButton("4"),
                              _buildButton("5"),
                              _buildButton("6"),
                              _buildButton("-"),
                              _buildButton("1"),
                              _buildButton("2"),
                              _buildButton("3"),
                              _buildButton("×"),
                              _buildButton("C"),
                              _buildButton("0"),
                              _buildButton("="),
                              _buildButton("%"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Footer Section
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Center(
                  child: Text(
                    "CalMaster",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return GestureDetector(
      onTap: () => onButtonPressed(text),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
