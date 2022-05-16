import 'package:chewata/games/wordle/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);
  final keys = const <List<String>>[
    ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
    ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
  ];

  @override
  Widget build(BuildContext context) {
    final keyboardBloc = BlocProvider.of<KeyboardBloc>(context);

    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final letter in keys[0])
                Expanded(
                  child: KeyUnit(
                    text: letter,
                    onPressed: () => keyboardBloc.add(KeyPressEvent(letter)),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox.shrink()),
              for (final letter in keys[1])
                Expanded(
                  flex: 2,
                  child: KeyUnit(
                    text: letter,
                    onPressed: () => keyboardBloc.add(KeyPressEvent(letter)),
                  ),
                ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: KeyUnit(
                  text: "Enter",
                  onPressed: () => keyboardBloc.add(EnterEvent()),
                ),
              ),
              for (final letter in keys[2])
                Expanded(
                  flex: 2,
                  child: KeyUnit(
                    text: letter,
                    onPressed: () => keyboardBloc.add(KeyPressEvent(letter)),
                  ),
                ),
              Expanded(
                flex: 3,
                child: KeyUnit(
                  text: "Del",
                  onPressed: () => keyboardBloc.add(DeleteEvent()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class KeyUnit extends StatelessWidget {
  const KeyUnit({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
