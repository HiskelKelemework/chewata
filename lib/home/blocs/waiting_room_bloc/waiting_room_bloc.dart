import 'package:chewata/home/index.dart';
import 'package:chewata/infrastructure/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'waiting_room_event.dart';
part 'waiting_room_state.dart';

class WaitingRoomBloc extends Bloc<WaitingRoomEvent, WaitingRoomState> {
  WaitingRoomBloc(this._connBloc) : super(RoomIdle()) {
    _connBloc.addListener("game:joined", _onGameJoined);
    _connBloc.addListener("game:left", _onGameLeft);
    _connBloc.addListener("game:started", _onGameStarted);
    _connBloc.addListener("game:msg", _onMsg);

    on<_JoinedGame>((_, e) => e(JoinedGame()));
    on<_LeftGame>((_, e) => e(LeftGame()));
    on<_GameStarted>((_, e) => e(GameStarted()));
    on<_NewMessage>((m, e) => e(NewMessage(msg: m.msg)));
    on<JoinGame>(_onJoinGame);
    on<SendMsg>(_onSendMsg);
  }

  final ConnectionBloc _connBloc;

  @override
  Future<void> close() {
    _connBloc.removeListener("game:joined");
    _connBloc.removeListener("game:left");
    _connBloc.removeListener("game:started");
    _connBloc.removeListener("game:msg");
    return super.close();
  }

  void _onGameJoined(dynamic data) => add(_JoinedGame());
  void _onGameLeft(dynamic data) => add(_LeftGame());
  void _onGameStarted(dynamic data) => add(_GameStarted());
  void _onMsg(dynamic data) => add(
        _NewMessage(
          msg: Message(
            text: "",
            senderType: Sender.other,
            senderId: "",
          ),
        ),
      );

  void _onSendMsg(SendMsg event, Emitter emit) {
    // send message through socket
    emit(
      NewMessage(
        msg: Message(
          text: event.msg,
          senderType: Sender.own,
          senderId: "",
        ),
      ),
    );
  }

  void _onJoinGame(JoinGame event, Emitter emit) {}
}
