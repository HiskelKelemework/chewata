import 'package:chewata/games/wordle/bloc/index.dart';
import 'package:chewata/games/wordle/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardBloc = BlocProvider.of<BoardBloc>(context);

    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      child: AspectRatio(
        aspectRatio: boardBloc.maxWordLength / boardBloc.maxAttempts,
        child: BlocBuilder<BoardBloc, BoardState>(
          builder: (_, BoardState state) {
            if (state is BoardUpdated) {
              return GridView.builder(
                itemCount: 30,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (_, int i) {
                  final row = i ~/ boardBloc.maxWordLength;
                  final col = i % boardBloc.maxWordLength;
                  final content = state.resultOf(row, col);
                  return Tile(content: content);
                },
              );
            }

            return const Center(child: Text("should never happen"));
          },
        ),
      ),
    );
  }
}
