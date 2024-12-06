import 'package:flutter/material.dart';
import 'package:temperature_converter/unit.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Unit> units = [
    Unit(u: "Celsius"),
    Unit(u: "Fahrenheit"),
    Unit(u: "Kelvin"),
  ];
  double totalResult = 0;
  double x = 0;
  String U = '';
  String U1 = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Temperature Converter'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('From'),
              const SizedBox(
                height: 20,
              ),
              DropdownMenu(
                onSelected: (u) {
                  if (u != null) {
                    U = u.u;
                  } else {
                    totalResult = 0;
                  }
                  updateTotalRdsult();
                },
                dropdownMenuEntries:
                    units.map<DropdownMenuEntry<Unit>>((Unit u) {
                  return DropdownMenuEntry(value: u, label: "${u.u}");
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (textFieldText) {
                  setState(() {
                    x = double.parse(textFieldText);
                    updateTotalRdsult();
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('To'),
              const SizedBox(
                height: 20,
              ),
              DropdownMenu(
                onSelected: (u) {
                  if (u != null) {
                    U1 = u.u;
                  } else {
                    totalResult = 0;
                  }
                  updateTotalRdsult();
                },
                dropdownMenuEntries:
                    units.map<DropdownMenuEntry<Unit>>((Unit u) {
                  return DropdownMenuEntry(value: u, label: "${u.u}");
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Result: $totalResult'),
            ],
          ),
        ),
      ),
    );
  }

  void updateTotalRdsult() {
    double Result = 0;
    if (U == "Celsius") {
      if (U1 == "Celsius") {
        Result = x;
      } else if (U1 == "Fahrenheit") {
        Result = (x * 1.8) + 32;
      } else if (U1 == "Kelvin") {
        Result = x + 273.15;
      }
    } else if (U == "Fahrenheit") {
      if (U1 == "Celsius") {
        Result = (x - 32) / 1.8;
      } else if (U1 == "Fahrenheit") {
        Result = x;
      } else if (U1 == "Kelvin") {
        Result = ((x - 32) / 1.8) + 273.15;
      }
    } else if (U == "Kelvin") {
      if (U1 == "Celsius") {
        Result = x - 273.15;
      } else if (U1 == "Fahrenheit") {
        Result = ((x - 273.15) * 1.8) + 32;
      } else if (U1 == "Kelvin") {
        Result = x;
      }
    }

    setState(() {
      totalResult = Result;
    });
  }
}
