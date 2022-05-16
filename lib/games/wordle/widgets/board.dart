import 'package:chewata/games/wordle/widgets/index.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 420,
      ),
      child: GridView.builder(
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (_, int i) {
          return const Tile();
        },
      ),
    );
  }
}
