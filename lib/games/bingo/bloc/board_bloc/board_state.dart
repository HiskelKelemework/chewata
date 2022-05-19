part of 'board_bloc.dart';

abstract class BoardState {}

class BoardUpdated extends BoardState {
  final Board board;
  BoardUpdated({required this.board});
}

class GameWon extends BoardState {}

class GameOver extends BoardState {}
