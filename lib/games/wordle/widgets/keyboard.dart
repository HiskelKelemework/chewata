import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);
  final keys = const <List<String>>[
    ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
    ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final letter in keys[0])
                Expanded(child: KeyUnit(text: letter)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox.shrink()),
              for (final letter in keys[1])
                Expanded(flex: 2, child: KeyUnit(text: letter)),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 3, child: KeyUnit(text: "Enter")),
              for (final letter in keys[2])
                Expanded(
                  flex: 2,
                  child: KeyUnit(text: letter),
                ),
              const Expanded(flex: 3, child: KeyUnit(text: "Del")),
            ],
          ),
        ],
      ),
    );
  }
}

class KeyUnit extends StatelessWidget {
  const KeyUnit({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(child: Text(text)),
    );
  }
}
