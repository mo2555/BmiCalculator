import 'package:flutter/material.dart';

import '../Consts/consts.dart';
import '../Data/data.dart';

class BmiResultScreen extends StatelessWidget {
  final Data data;

  BmiResultScreen( {required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('BMI RESULT',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined,
          color: Colors.white70,
          ), onPressed: () {
            Navigator.pop(context);
        },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${data.isMale ? 'Male' : 'Female'}',
              style: resultStyle,
            ),
            Text(
              'Age : ${data.age}',
              style: resultStyle,
            ),
            Text(
              'Weight : ${data.weight}',
              style:resultStyle,
            ),
            Text(
              'Height : ${data.height.round()}',
              style: resultStyle,
            ),
            Text(
              'Result : ${data.result.round()}',
              style: resultStyle,
            ),
          ],
        ),
      ),
    );
  }
}
