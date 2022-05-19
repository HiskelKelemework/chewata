part of 'board_bloc.dart';

abstract class BoardEvent {}

class CellClicked extends BoardEvent {
  final int row;
  final int col;
  CellClicked({required this.row, required this.col});
}

class _GameOver extends BoardEvent {}
