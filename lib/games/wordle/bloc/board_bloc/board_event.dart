part of 'board_bloc.dart';

abstract class BoardEvent {}

class DisplayLetters extends BoardEvent {
  final Attempt attempt;
  DisplayLetters(this.attempt);
}

class AttemptAnswer extends BoardEvent {
  final Attempt attempt;
  AttemptAnswer(this.attempt);
}
