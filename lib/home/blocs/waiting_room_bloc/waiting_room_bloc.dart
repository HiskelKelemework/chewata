import 'package:chewata/home/index.dart';
import 'package:chewata/infrastructure/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'waiting_room_event.dart';
part 'waiting_room_state.dart';
part 'real_time_events.dart';

class WaitingRoomBloc extends Bloc<WaitingRoomEvent, WaitingRoomState> {
  WaitingRoomBloc(this._connBloc, this.roomId) : super(RoomIdle()) {
    _connBloc.addListener(ServerEvents.gameJoined, _onGameJoined);
    _connBloc.addListener(ServerEvents.gameLeft, _onGameLeft);
    _connBloc.addListener(ServerEvents.gameStarted, _onGameStarted);
    _connBloc.addListener(ServerEvents.gameWaitingRoomMsg, _onMsg);

    on<_JoinedGame>((_, e) => e(JoinedGame()));
    on<_JoinedWaitingRoom>((_, e) => e(JoinedWaitingRoom()));
    on<_LeftGame>((_, e) => e(LeftGame()));
    on<_GameStarted>((_, e) => e(GameStarted()));
    on<_NewMessage>((m, e) => e(NewMessage(msg: m.msg)));
    on<JoinGame>(_onJoinGame);
    on<SendMsg>(_onSendMsg);

    _connBloc.emitEvent(
      ClientEvents.gameWaitingRoomJoin,
      data: roomId,
      ack: () => _onWaitingRoomJoined(null),
    );
  }

  final ConnectionBloc _connBloc;
  final String roomId;

  @override
  Future<void> close() {
    _connBloc.removeListener(ServerEvents.gameJoined);
    _connBloc.removeListener(ServerEvents.gameLeft);
    _connBloc.removeListener(ServerEvents.gameStarted);
    _connBloc.removeListener(ServerEvents.gameWaitingRoomMsg);
    _connBloc.emitEvent(ClientEvents.gameWaitingRoomLeave, data: roomId);
    return super.close();
  }

  void _onWaitingRoomJoined(dynamic data) {
    add(_JoinedWaitingRoom());
    add(
      _NewMessage(
        msg: Message(
          text: "You joined the chat",
          senderType: Sender.server,
          senderId: "",
        ),
      ),
    );
  }

  void _onGameJoined(dynamic data) => add(_JoinedGame());

  void _onGameLeft(dynamic data) => add(_LeftGame());

  void _onGameStarted(dynamic data) => add(_GameStarted());

  void _onMsg(dynamic data) {
    final json = data as Map<String, dynamic>;
    add(_NewMessage(msg: Message.fromJSON(json)));
  }

  void _onJoinGame(JoinGame event, Emitter emit) {}

  void _onSendMsg(SendMsg event, Emitter emit) {
    _connBloc.emitEvent(
      ClientEvents.gameWaitingRoomMsg,
      data: {"text": event.msg, "roomId": roomId},
    );

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
}
