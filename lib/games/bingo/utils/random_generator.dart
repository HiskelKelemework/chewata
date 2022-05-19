import 'package:chewata/games/bingo/index.dart';
import 'package:flutter/material.dart';

List<int> shuffledBingo(int min, int max, int select) {
  assert(max > min);
  assert(select <= max - min);

  final fullList = List.generate(max - min, (i) => i + min);
  fullList.shuffle();
  fullList.shuffle();
  return fullList.sublist(0, select);
}

List<int> addFreeTile(List<int> col) {
  assert(col.length == 5);
  col[2] = -1;
  return col;
}

Color cellColor(String group) {
  final colors = {
    'B': Colors.orange.shade900,
    'I': Colors.yellow.shade700,
    'N': Colors.green,
    'G': Colors.blue,
    'O': Colors.purple,
  };

  return colors[group] ?? Colors.grey;
}

List<Call> randomCalls() {
  final calls = <Call>[
    ...shuffledBingo(1, 16, 15).map((v) => Call(group: 'B', val: v)),
    ...shuffledBingo(16, 31, 15).map((v) => Call(group: 'I', val: v)),
    ...shuffledBingo(31, 46, 15).map((v) => Call(group: 'N', val: v)),
    ...shuffledBingo(46, 61, 15).map((v) => Call(group: 'G', val: v)),
    ...shuffledBingo(61, 76, 15).map((v) => Call(group: 'O', val: v)),
  ];

  for (int _ in List.generate(5, (_) => _)) {
    calls.shuffle();
  }

  return calls;
}
