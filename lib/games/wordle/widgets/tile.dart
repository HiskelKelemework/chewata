import 'package:chewata/games/wordle/models/index.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({Key? key, required this.content}) : super(key: key);
  final Result content;

  @override
  Widget build(BuildContext context) {
    final bgColor = content.exactCorrect
        ? Colors.green
        : content.outOfPlaceCorrect
            ? const Color.fromARGB(255, 192, 174, 14)
            : content.temporary
                ? Colors.grey
                : Colors.grey.shade700;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          content.text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
