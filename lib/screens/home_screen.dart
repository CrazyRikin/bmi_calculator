import 'package:bmi_calculator/provider/details_provider.dart';
import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    return Consumer<DetailsProvider>(
      builder: (context, detailsProvider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 48, 80),
          title: const Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 9, 48, 80),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: AssetImage("assets/icon/appIcon.png"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.monitor_weight_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            maxLength: 7,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              label: Text(
                                "Weight in kgs",
                              ),
                              border: OutlineInputBorder(),
                            ),
                            controller: weightController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "KiloGm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_2_sharp,
                          size: 50,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            maxLength: 5,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              label: Text(
                                "Height in meter",
                              ),
                              border: OutlineInputBorder(),
                            ),
                            controller: heightController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Meters",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (weightController.text.isNotEmpty &&
                            heightController.text.isNotEmpty) {
                          detailsProvider
                              .setHeight(double.parse(heightController.text));
                          detailsProvider
                              .setWeight(double.parse(weightController.text));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResultsPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter valid entries'),
                            ),
                          );
                        }
                      },
                      child: const Text("CALCULATE BMI"),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
