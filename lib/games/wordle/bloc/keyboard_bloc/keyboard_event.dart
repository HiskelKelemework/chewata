part of 'keyboard_bloc.dart';

abstract class KeyboardEvent {}

class KeyPressEvent extends KeyboardEvent {
  final String letter;
  KeyPressEvent(this.letter);
}

class EnterEvent extends KeyboardEvent {}

class DeleteEvent extends KeyboardEvent {}
