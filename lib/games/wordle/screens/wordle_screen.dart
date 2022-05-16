import 'package:chewata/games/wordle/widgets/index.dart';
import 'package:flutter/material.dart';

class WordleScreen extends StatelessWidget {
  const WordleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const <Widget>[
            SizedBox(height: 50),
            Board(),
            SizedBox(height: 50),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}
