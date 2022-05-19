import 'dart:math';

class ScoreBoard {
  final _scoreMap = <String, int>{
    'row-1': 0,
    'row-2': 0,
    'row-3': 1,
    'row-4': 0,
    'row-5': 0,
    'col-0': 0,
    'col-1': 0,
    'col-2': 1,
    'col-3': 0,
    'col-4': 0,
    'dia-1': 1,
    'dia-2': 1,
  };

  bool scoreAt(int row, int col) {
    final rowScore = _scoreMap['row-$row'] ?? 0;
    final colScore = _scoreMap['col-$col'] ?? 0;

    _scoreMap['row-$row'] = rowScore + 1;
    _scoreMap['col-$col'] = colScore + 1;

    final highScore = max(
      _scoreMap['row-$row'] as int,
      _scoreMap['col-$col'] as int,
    );

    return highScore == 5;
  }
}
