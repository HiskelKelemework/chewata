import 'package:chewata/games/bingo/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'board_event.dart';
part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc(Board board) : super(BoardUpdated(board: board)) {
    on<CellClicked>(_onCellClicked);
    on<_GameOver>(_onGameOver);

    callBoardBloc = CallBoardBloc(
      randomCalls(),
      onCallsComplete: _onCallsComplete,
    );
  }

  late final CallBoardBloc callBoardBloc;
  final _scoreBoard = ScoreBoard();

  @override
  Future<void> close() async {
    callBoardBloc.close();
    super.close();
  }

  void _onCellClicked(CellClicked event, Emitter emit) {
    if (state is! BoardUpdated) return;
    final board = (state as BoardUpdated).board;
    final cell = board.columns[event.col].elements[event.row];

    if (cell.clicked) return;
    final cellAsCall = Call(group: cell.group, val: cell.value);
    if (!callBoardBloc.callValid(cellAsCall)) return;

    board.columns[event.col].elements[event.row] = cell.copyWith(clicked: true);
    emit(BoardUpdated(board: board));

    final gameWon = _scoreBoard.scoreAt(event.row, event.col);
    if (!gameWon) return;

    callBoardBloc.add(EndCall());
    emit(GameWon());
  }

  void _onGameOver(_GameOver event, Emitter emit) {
    emit(GameOver());
  }

  void _onCallsComplete() {
    add(_GameOver());
  }
}
