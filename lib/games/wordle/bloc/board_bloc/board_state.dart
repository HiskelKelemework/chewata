part of 'board_bloc.dart';

abstract class BoardState {}

class BoardUpdated extends BoardState {
  final List<Attempt> states;
  final String correctWord;
  late List<List<Result>> _results;

  BoardUpdated({required this.correctWord, required this.states}) {
    _results = states.map((attempt) => attempt.results).toList();
  }

  Result resultOf(int row, int col) {
    if (row >= _results.length) return Result(text: '', temporary: true);
    if (col >= _results[row].length) return Result(text: '', temporary: true);

    return _results[row][col];
  }
}

class GameWon extends BoardState {}

class GameLost extends BoardState {}
