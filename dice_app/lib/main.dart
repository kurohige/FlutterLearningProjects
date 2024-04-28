import 'package:dice_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 17, 86, 73),
        body: GradientContainer(
          newColors: [
            Color.fromARGB(255, 51, 47, 125),
            Color.fromARGB(255, 17, 86, 73),
          ],
        ),
      ),
    ),
  );
}
