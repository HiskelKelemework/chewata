import 'package:chewata/games/wordle/bloc/index.dart';
import 'package:chewata/games/wordle/models/attempt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'keyboard_event.dart';

part 'keyboard_state.dart';

class KeyboardBloc extends Bloc<KeyboardEvent, KeyboardState> {
  KeyboardBloc(this._boardBloc) : super(KeyboardUpdatedState()) {
    on<KeyPressEvent>(_onKeyPress);
    on<EnterEvent>(_onEnter);
    on<DeleteEvent>(_onDelete);
  }

  final BoardBloc _boardBloc;
  final List<String> _attempt = [];

  _onKeyPress(KeyPressEvent event, Emitter emit) {
    if (_attempt.length == _boardBloc.maxWordLength) return;

    _attempt.add(event.letter);
    _boardBloc.add(DisplayLetters(Attempt(letters: _attempt, temporary: true)));
  }

  _onEnter(EnterEvent event, Emitter emit) {
    if (_attempt.length != _boardBloc.maxWordLength) return;
    _boardBloc.add(AttemptAnswer(Attempt(letters: _attempt.toList())));
    _attempt.clear();
  }

  _onDelete(DeleteEvent event, Emitter emit) {
    if (_attempt.isEmpty) return;
    _attempt.removeLast();
    _boardBloc.add(DisplayLetters(Attempt(letters: _attempt)));
  }
}
