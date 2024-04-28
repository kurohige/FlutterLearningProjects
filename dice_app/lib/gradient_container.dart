import 'package:dice_app/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:dice_app/assets.dart';

const Alignment beginAlightment = Alignment.center;
const Alignment endAlightment = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.newColors});

  const GradientContainer.purple({super.key})
      : newColors = const [
          Color.fromARGB(255, 51, 47, 125),
          Color.fromARGB(255, 114, 39, 39),
        ];

  final List<Color> newColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: beginAlightment,
          end: endAlightment,
          colors: newColors,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetImages.diceImages[1]!,
              width: 200,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Roll Dice'),
            )
          ],
        ),
      ),
    );
  }
}
