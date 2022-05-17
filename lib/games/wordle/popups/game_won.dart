import 'package:chewata/games/wordle/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameWonPopup extends StatelessWidget {
  const GameWonPopup({Key? key, required this.boardBloc}) : super(key: key);
  final BoardBloc boardBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BoardBloc, BoardState>(
      bloc: boardBloc,
      listenWhen: (_, current) => current is BoardUpdated,
      listener: (_, current) => Navigator.of(context).pop(),
      builder: (_, __) {
        return Dialog(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You won"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    boardBloc.add(Replay());
                  },
                  child: const Text("Replay"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Quit"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
