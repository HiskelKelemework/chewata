import 'package:chewata/games/bingo/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BingoBoard extends StatelessWidget {
  const BingoBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 380,
        maxHeight: 456,
      ),
      child: BlocConsumer<BoardBloc, BoardState>(
        listenWhen: (_, current) => current is GameWon || current is GameOver,
        listener: (_, state) {
          showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state is GameWon)
                        const Text("Congratulations, you won!")
                      else
                        const Text("Game Over"),
                    ],
                  ),
                ),
              );
            },
          );
        },
        buildWhen: (_, current) => current is BoardUpdated,
        builder: (_, BoardState state) {
          state as BoardUpdated;

          return GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemBuilder: (_, int i) {
              final row = i ~/ 5;
              final col = i % 5;
              final BoardCell cell = state.board.columns[col].elements[row];

              return Tile(cellData: cell, row: row, col: col);
            },
          );
        },
      ),
    );
  }
}
