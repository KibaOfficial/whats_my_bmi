// Copyright (c) 2023 KibaOfficial
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// ignore_for_file: avoid_unnecessary_containers, prefer_final_fields, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// local
import 'package:bmi_calc/components/reusableCard.dart';
import 'package:bmi_calc/components/iconWithLabel.dart';
import 'package:bmi_calc/components/roundedBTN.dart';
import 'package:bmi_calc/pages/result.dart';
import 'package:bmi_calc/pages/sidebar.dart';

enum GenderSelection { Male, Female }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inActiveColor = const Color(0xff1d1e33);
  final activeColor = const Color(0x011d1e33);
  GenderSelection selection = GenderSelection.Male;
  int _height = 120;
  int _weight = 70;
  int _age = 18;

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
                  fontWeight:
                      FontWeight.w700, // optional, um Fettschrift zu verwenden
                ),
              )
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff0a0321),
      ),
      drawer: const Sidebar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReusableCard(
                    color: selection == GenderSelection.Male
                        ? activeColor
                        : inActiveColor,
                    myChild: const iconWithLabel(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection = GenderSelection.Male;
                      });
                    },
                  ),
                  ReusableCard(
                    color: selection == GenderSelection.Male
                        ? inActiveColor
                        : activeColor,
                    myChild: const iconWithLabel(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection = GenderSelection.Female;
                      });
                    },
                  ),
                ],
              ),
            ),
            ReusableCard(
              color: const Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Height',
                      style: TextStyle(fontSize: 20.0, color: Colors.white70),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        child: Text(
                          _height.toString(),
                          style: const TextStyle(
                            fontSize: 47.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: const Text(
                          'cm',
                          style: TextStyle(color: Colors.white70),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xffeb1555),
                        overlayColor: const Color(0x80eb1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.toInt().round();
                          });
                        },
                        value: _height.toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
              onpress: () {},
            ),
            Expanded(
              child: Row(
                children: [
                  ReusableCard(
                    color: const Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.white70),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              child: Text(
                                _weight.toString(),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: const Text(
                                'kg',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                              color: const Color(0xff0a0e21),
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  _weight = _weight + 5;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundedBTN(
                              color: const Color(0xff0a0e21),
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  _weight = _weight - 5;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onpress: () {},
                  ),
                  ReusableCard(
                    color: const Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.white70),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              child: Text(
                                _age.toString(),
                                style: const TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: const Text(
                                "yr's",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                              color: const Color(0xff0a0e21),
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundedBTN(
                              color: const Color(0xff0a0e21),
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onpress: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Result(
                      age: _age,
                      gender: selection,
                      height: _height,
                      weight: _weight,
                    ),
                  ),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text("CALCULATE YOUR BMI"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
