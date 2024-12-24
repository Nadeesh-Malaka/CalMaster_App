import 'package:flutter/material.dart';

class GPACalculator extends StatefulWidget {
  const GPACalculator({Key? key}) : super(key: key);

  @override
  _GPACalculatorState createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  final List<TextEditingController> _gradeControllers = [];
  final List<TextEditingController> _creditControllers = [];
  double gpa = 0.0;

  void calculateGPA() {
    double totalPoints = 0.0;
    double totalCredits = 0.0;

    for (int i = 0; i < _gradeControllers.length; i++) {
      try {
        double grade = double.parse(_gradeControllers[i].text);
        double credits = double.parse(_creditControllers[i].text);
        totalPoints += grade * credits;
        totalCredits += credits;
      } catch (e) {
        // Skip invalid entries
      }
    }

    setState(() {
      gpa = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
    });
  }

  void addCourse() {
    setState(() {
      _gradeControllers.add(TextEditingController());
      _creditControllers.add(TextEditingController());
    });
  }

  void clearAll() {
    setState(() {
      _gradeControllers.clear();
      _creditControllers.clear();
      gpa = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'GPA Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _gradeControllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Grade Input
                            Flexible(
                              child: TextField(
                                controller: _gradeControllers[index],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Grade',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Credit Input
                            Flexible(
                              child: TextField(
                                controller: _creditControllers[index],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Credits',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: addCourse,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Add Course',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: calculateGPA,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Calculate GPA',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: clearAll,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Clear All',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "GPA: ${gpa.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
