import 'package:chewata/games/wordle/models/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'board_state.dart';
part 'board_event.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc(this.correctWord)
      : super(
          BoardUpdated(
            correctWord: correctWord,
            states: <Attempt>[],
          ),
        ) {
    on<DisplayLetters>(_onDisplayLetters);
    on<AttemptAnswer>(_onAttemptAnswer);
  }

  final String correctWord;
  final int maxWordLength = 5;
  final int maxAttempts = 6;

  final List<Attempt> _attempts = [];

  _onDisplayLetters(DisplayLetters event, Emitter emit) {
    if (_maxAttemptsGuard()) return;
    emit(
      BoardUpdated(
        correctWord: correctWord,
        states: [..._attempts, event.attempt],
      ),
    );
  }

  _onAttemptAnswer(AttemptAnswer event, Emitter emit) {
    if (_maxAttemptsGuard()) return;
    _attempts.add(event.attempt);
    emit(BoardUpdated(correctWord: correctWord, states: _attempts));
    // correct answer and generate a results object.
  }

  bool _maxAttemptsGuard() => _attempts.length == maxAttempts;
}
