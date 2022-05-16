part of 'keyboard_bloc.dart';

abstract class KeyboardEvent {}

class KeyEvent extends KeyboardEvent {}

class EnterEvent extends KeyboardEvent {}

class DeleteEvent extends KeyboardEvent {}
