// Copyright (c) 2023 KibaOfficial
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last

import 'package:bmi_calc/components/reusableCard.dart';
import 'package:bmi_calc/modules/calcBMI.dart';
import 'package:bmi_calc/pages/home.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int height;
  final int weight;
  final int age;
  final GenderSelection gender;
  const Result({
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    super.key,
  });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late CalcBMI _calcBMI;

  @override
  void initState() {
    super.initState();
    _calcBMI = CalcBMI(
      height: widget.height,
      weight: widget.weight,
      age: widget.age,
      gender: widget.gender,
    );
    _calcBMI.calcBMI();
  }

  Color _getColorForResult(String result) {
    Color color;
    switch (result) {
      case 'Obese':
        color = Colors.red;
        break;
      case 'Overweight':
        color = Colors.yellow;
        break;
      case 'Normalweight':
        color = Colors.green;
        break;
      case 'Underweight':
        color = Colors.blue;
        break;
      default:
        color = Colors.black;
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.fitness_center, color: Colors.amber, size: 40),
              SizedBox(width: 5),
              Text(
                "What's my BMI?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff0a0321),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: const Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ReusableCard(
            color: const Color(0xff1d1e33),
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    _calcBMI.getResult(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: _getColorForResult(_calcBMI.getResult()),
                    ),
                  ),
                ),
                Text(
                  _calcBMI.calcBMI(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
                Text(
                  _calcBMI.getInterpretation(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onpress: () {},
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Re-calculate".toUpperCase()),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
