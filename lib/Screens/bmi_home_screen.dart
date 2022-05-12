import 'dart:math';

import 'package:bmi_calculator_1/Consts/consts.dart';
import 'package:bmi_calculator_1/Screens/bmi_result_screen.dart';
import 'package:flutter/material.dart';

import '../Data/data.dart';

class BmiHomeScreen extends StatefulWidget {
  const BmiHomeScreen({Key? key}) : super(key: key);

  @override
  State<BmiHomeScreen> createState() => _BmiHomeScreenState();
}

class _BmiHomeScreenState extends State<BmiHomeScreen> {
  bool isMale = true;

  double height = 120.0;

  int weight = 80, age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isMale = true;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isMale ? Colors.white70 : Colors.grey[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.male,
                              size: 80,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'MALE',
                              style: textStyle25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isMale = false;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.white70 : Colors.grey[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.female,
                              size: 80,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'FEMALE',
                              style: textStyle25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: decorationStyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: textStyle30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${height.round()}',
                        style: textStyle40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'CM',
                        style: textStyle15,
                      ),
                    ],
                  ),
                  Slider(
                    inactiveColor: Colors.white60,
                    activeColor: Colors.black,
                    value: height,
                    onChanged: (value) {
                      height = value;
                      setState(() {});
                    },
                    max: 250,
                    min: 50,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: decorationStyle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: textStyle20,
                          ),
                          Text(
                            '$age',
                            style: textStyle30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  if (age >= 1) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white70,
                                ),
                                mini: true,
                                heroTag: 'subAge',
                                backgroundColor: Colors.black,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white70,
                                ),
                                mini: true,
                                heroTag: 'addAge',
                                backgroundColor: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: decorationStyle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: textStyle20,
                          ),
                          Text(
                            '$weight',
                            style: textStyle30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  if (weight >= 1) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white70,
                                ),
                                mini: true,
                                heroTag: 'subWeight',
                                backgroundColor: Colors.black,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white70,
                                ),
                                mini: true,
                                heroTag: 'addWeight',
                                backgroundColor: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height/100,2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => BmiResultScreen(
                        data: Data(
                      height: height,
                      result: result,
                      age: age,
                      weight: weight,
                      isMale: isMale,
                    )),
                  ),
                );
              },
              child: const Text(
                'CALCULATE',
                style: textStyle20,
              ),
            ),
            color: Colors.white70,
            width: double.infinity,
            height: 50,
          ),
        ],
      ),
    );
  }
}
