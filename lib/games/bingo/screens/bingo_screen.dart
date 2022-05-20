import 'package:chewata/games/bingo/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BingoScreen extends StatelessWidget {
  const BingoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BoardBloc(Board.fromJSON({
        'B': shuffledBingo(1, 16, 5),
        'I': shuffledBingo(16, 31, 5),
        'N': addFreeTile(shuffledBingo(31, 46, 5)),
        'G': shuffledBingo(46, 61, 5),
        'O': shuffledBingo(61, 76, 5),
      })),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "Bingo",
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  CallBoard(),
                  const SizedBox(height: 16),
                  const BingoBoard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
