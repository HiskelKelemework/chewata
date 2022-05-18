import 'package:chewata/games/wordle/bloc/index.dart';
import 'package:chewata/games/wordle/popups/index.dart';
import 'package:chewata/games/wordle/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardBloc = BlocProvider.of<BoardBloc>(context);

    return BlocConsumer<BoardBloc, BoardState>(
      listenWhen: (_, current) => current is GameWon || current is GameLost,
      listener: (_, BoardState state) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return state is GameWon
                ? GameWonPopup(boardBloc: boardBloc)
                : GameLostPopup(boardBloc: boardBloc);
          },
        );
      },
      buildWhen: (_, current) => current is BoardUpdated,
      builder: (_, BoardState state) {
        state as BoardUpdated;

        return Container(
          constraints: const BoxConstraints(
            maxWidth: 380,
            maxHeight: 456,
          ),
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemBuilder: (_, int i) {
              final row = i ~/ boardBloc.maxWordLength;
              final col = i % boardBloc.maxWordLength;
              final content = state.resultOf(row, col);

              return Padding(
                padding: const EdgeInsets.all(2),
                child: Tile(content: content),
              );
            },
          ),
        );
      },
    );
  }
}
