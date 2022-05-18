import 'package:chewata/games/wordle/models/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'board_state.dart';
part 'board_event.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc(this._wordsDb)
      : super(
          BoardUpdated(
            correctWord: _wordsDb.nextWord,
            states: <Attempt>[],
          ),
        ) {
    _correctWord = _wordsDb.currentWord!;

    on<DisplayLetters>(_onDisplayLetters);
    on<AttemptAnswer>(_onAttemptAnswer);
    on<Replay>(_onReplay);
  }

  late String _correctWord;
  String get correctWord => _correctWord;
  final int maxWordLength = 5;
  final int maxAttempts = 6;
  final WordsDB _wordsDb;
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
    if (event.attempt.letters.length != maxWordLength) return;

    _attempts.add(event.attempt);
    emit(BoardUpdated(correctWord: correctWord, states: _attempts));

    if (event.attempt.correct) {
      emit(GameWon());
      return;
    }

    if (_attempts.length == maxAttempts) {
      emit(GameLost());
    }
  }

  _onReplay(Replay event, Emitter emit) {
    _attempts.clear();
    _correctWord = _wordsDb.nextWord;
    emit(BoardUpdated(correctWord: correctWord, states: _attempts));
  }

  bool _maxAttemptsGuard() => _attempts.length == maxAttempts;
}
