import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int heightFeet = 5;
  int heightInches = 0;
  int weight = 150;
  double bmi = 0.0;
  String bmiCategory = "Normal";

  void calculateBMI() {
    int totalHeightInches = (heightFeet * 12) + heightInches;
    double heightMeters = totalHeightInches * 0.0254;
    double weightKg = weight * 0.453592;

    setState(() {
      bmi = weightKg / (heightMeters * heightMeters);
      bmiCategory = getBMICategory(bmi);
    });
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 24.9) return "Normal";
    if (bmi < 29.9) return "Overweight";
    return "Obese";
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
                  'BMI Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Height (ft)",
                          style: TextStyle(color: Colors.white),
                        ),
                        DropdownButton<int>(
                          value: heightFeet,
                          dropdownColor: Colors.blueGrey,
                          items: List.generate(8, (index) => index + 1)
                              .map((value) => DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              heightFeet = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Height (in)",
                          style: TextStyle(color: Colors.white),
                        ),
                        DropdownButton<int>(
                          value: heightInches,
                          dropdownColor: Colors.blueGrey,
                          items: List.generate(12, (index) => index)
                              .map((value) => DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              heightInches = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text(
                      "Weight (lbs)",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: weight.toDouble(),
                      min: 50,
                      max: 300,
                      divisions: 250,
                      label: weight.toString(),
                      onChanged: (value) {
                        setState(() {
                          weight = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "BMI: ${bmi.toStringAsFixed(1)}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Category: $bmiCategory",
                  style: const TextStyle(
                    fontSize: 20,
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
