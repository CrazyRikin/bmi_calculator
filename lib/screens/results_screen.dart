import 'package:bmi_calculator/provider/details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(
      builder: (context, detailsProvider, child) => Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 9, 48, 80),
        ),
        body: Container(
          color: const Color.fromARGB(255, 9, 48, 80),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Your bmi is : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Text(
                        (detailsProvider.weight! /
                                (detailsProvider.height! *
                                    detailsProvider.height!))
                            .toStringAsFixed(2),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                SfRadialGauge(
                  backgroundColor: Colors.white,
                  enableLoadingAnimation: true,
                  animationDuration: 3000,
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 13, maximum: 35, ranges: <GaugeRange>[
                      GaugeRange(
                        label: "Underweight",
                        startValue: 13,
                        endValue: 18.5,
                        color: Colors.blue,
                      ),
                      GaugeRange(
                        label: "Normal",
                        startValue: 18.5,
                        endValue: 24.9,
                        color: Colors.green,
                      ),
                      GaugeRange(
                        label: "Overweight",
                        startValue: 24.9,
                        endValue: 29.9,
                        color: Colors.orange,
                      ),
                      GaugeRange(
                        label: "Obese",
                        startValue: 29.9,
                        endValue: 35,
                        color: Colors.red,
                      )
                    ], pointers: <GaugePointer>[
                      NeedlePointer(
                          value: (detailsProvider.weight! /
                              (detailsProvider.height! *
                                  detailsProvider.height!))),
                    ])
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 9, 48, 80))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
