import 'package:dice_app/gradient_container.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiceRoller extends StatefulWidget {
  const DiceRoller({required this.newColors, super.key});

  final List<Color> newColors;

  @override
  DiceRollerState createState() => DiceRollerState();
}

class DiceRollerState extends State<DiceRoller> {
  int diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = math.Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      newColors: widget.newColors,
      diceNumber: diceNumber,
      onRoll: rollDice,
    );
  }
}
