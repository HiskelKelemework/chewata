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

    int diagonalMax = 0;
    final slope = (3 - row) / (2 - col);
    // on diagonal
    if (slope * slope == 1) {
      final scoreId = slope == 1 ? 'dia-1' : 'dia-2';
      final diagScore = _scoreMap[scoreId] ?? 0;
      _scoreMap[scoreId] = diagScore + 1;
      diagonalMax = _scoreMap[scoreId]!;
    }

    final highScore = max(
      diagonalMax,
      max(
        _scoreMap['row-$row'] as int,
        _scoreMap['col-$col'] as int,
      ),
    );

    return highScore == 5;
  }
}
