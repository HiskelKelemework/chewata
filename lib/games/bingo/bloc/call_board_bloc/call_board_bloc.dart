import 'dart:async';

import 'package:chewata/games/bingo/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'call_board_event.dart';
part 'call_board_state.dart';

class CallBoardBloc extends Bloc<CallBoardEvent, CallBoardState> {
  CallBoardBloc(
    this._calls, {
    required this.onCallsComplete,
  }) : super(CallBoardIdle()) {
    on<MakeCall>(_onMakeCall);
    on<EndCall>(_onEndCall);
    _timer = Timer.periodic(const Duration(milliseconds: 2500), _pushVal);
  }

  final List<Call> _calls;
  final Function() onCallsComplete;

  late Timer _timer;
  int _callIndex = 0;

  @override
  Future<void> close() async {
    _timer.cancel();
    super.close();
  }

  void _pushVal(_) {
    if (_callIndex == _calls.length) {
      add(EndCall());
      onCallsComplete();
      return;
    }

    add(MakeCall(call: _calls[_callIndex]));
    _callIndex++;
  }

  _onMakeCall(MakeCall event, Emitter emit) {
    emit(CallMade(call: event.call));
  }

  _onEndCall(EndCall event, Emitter emit) {
    _timer.cancel();
    emit(CallEnded());
  }

  bool callValid(Call call) {
    if (state is! CallMade) return false;
    final lastCall = (state as CallMade).call;
    return lastCall.equals(call);
  }
}
